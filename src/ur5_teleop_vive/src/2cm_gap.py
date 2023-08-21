
import rosbag
import rospy
from tf.transformations import euler_from_quaternion
import math

def euclidean_distance(p1, p2):
    eu_distance = math.sqrt((p1[0] - p2[0]) ** 2 + (p1[1] - p2[1]) ** 2 + (p1[2] - p2[2]) ** 2)
    return round(eu_distance,3)
    # return eu_distance

def interpolate_pose(pose1, pose2, num_points):
    interpolated_poses = []
    print("in interpolation")
    for i in range(num_points):
        ratio = float(i) / float(num_points - 1)
        position = (
            pose1[0] + ratio * (pose2[0] - pose1[0]),
            pose1[1] + ratio * (pose2[1] - pose1[1]),
            pose1[2] + ratio * (pose2[2] - pose1[2])
        )
        orientation = (
            pose1[3] + ratio * (pose2[3] - pose1[3]),
            pose1[4] + ratio * (pose2[4] - pose1[4]),
            pose1[5] + ratio * (pose2[5] - pose1[5])
        )
        interpolated_poses.append((position, orientation))
    # print(interpolated_poses)    
    return interpolated_poses


def process_tcp_poses(bag_file, min_distance=0.02, interpolation_steps=10):
    # Lists to store pose data
    positions = []
    orientations = []
    distance_list = []
    seq_list = []

    # Read the bag file
    bag = rosbag.Bag(bag_file)

    last_position = None
    last_orientation = None
    for topic, msg, t in bag.read_messages(topics=['/ee_pose']):
        # Extract position
        x, y, z = msg.x, msg.y, msg.z

        # Extract orientation (convert quaternion to Euler angles)
        roll, pitch, yaw = msg.roll, msg.pitch, msg.yaw

        # Check if this pose is at least min_distance away from the last saved pose
        current_position = (x, y, z)
        current_orientation = (roll, pitch, yaw)

        if last_position is None:
            last_position = current_position
            last_orientation = current_orientation
            positions.append(last_position)
            orientations.append(last_orientation)
            seq_list.append(msg.header.seq)

        distance = euclidean_distance(last_position, current_position)

        if last_position is not None and distance == min_distance:
            # Interpolate between last_position and current_position
            interpolated_poses = interpolate_pose((last_position + last_orientation), (current_position + current_orientation), interpolation_steps)
            closest_interpolated_pose = min(interpolated_poses, key=lambda pose: euclidean_distance(last_position, pose[0]))

            positions.append(closest_interpolated_pose[0])
            orientations.append(closest_interpolated_pose[1])
            seq_list.append(msg.header.seq)

            distance_list.append(distance)
            last_position = current_position
            last_orientation = current_orientation

    bag.close()

    return positions, orientations, distance_list, seq_list


if __name__ == "__main__":
    # Replace 'your_bag_file.bag' with the actual path to your ROS bag file containing the TCP poses.
    bag_file_path = '/home/sid/Documents/ur5_teleop_ws/src/ur5_teleop_vive/src/my_tcp_poses.bag'
    positions, orientations, distance_list, seq_list = process_tcp_poses(bag_file_path)

    # Printing the results
    for i, (x, y, z) in enumerate(positions):
        roll, pitch, yaw = orientations[i]
        print(f"Pose {i + 1}:")
        print(f"Position: x={x}, y={y}, z={z}")
        print(f"Orientation: roll={roll}, pitch={pitch}, yaw={yaw}")
        print("------------------------")

    # Printing the relevant Euclidean distance values (at least 2 cm apart)
    print("Relevant Euclidean Distances (at least 2 cm apart):")
    for i, distance in enumerate(distance_list):
        print(f"Distance {i + 1}: {distance: } meters")
        print("Seq: ", seq_list[i])
