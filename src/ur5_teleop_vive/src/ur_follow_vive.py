"""
Face_tracking01
Python program for realtime face tracking of a Universal Robot (tested with UR5cb)
Demonstration Video: https://youtu.be/HHb-5dZoPFQ
Explanation Video: https://www.youtube.com/watch?v=9XCNE0BmtUg

Created by Robin Godwyll
License: GPL v3 https://www.gnu.org/licenses/gpl-3.0.en.html

"""

import URBasic
import math
import numpy as np
import sys
import cv2
import time
# import imutils
# from imutils.video import VideoStream
import math3d as m3d
from math import pi
import sys
import copy
import rospy
import geometry_msgs.msg
import message_filters
from sensor_msgs.msg import Joy, JointState
from math import pi
from std_msgs.msg import String, Header
import visualization_msgs.msg
from visualization_msgs.msg import Marker
import time
from tf.transformations import euler_from_quaternion
import hydra
from hydra import compose, initialize
from robotiq_gripper import Gripper
import rospy

def get_ee_marker(mesh_resource, color):
    marker = Marker()

    marker = Marker()
    marker.header.frame_id = 'base'
    # marker.header.stamp  = rospy.get_rostime()
    marker.ns = "robot"
    marker.id = 0
    marker.type = 10 # mesh
    marker.mesh_resource = mesh_resource
    marker.action = 0
    marker.scale.x = 1.0
    marker.scale.y = 1.0
    marker.scale.z = 1.0

    marker.color.r = color[0]
    marker.color.g = color[1]
    marker.color.b = color[2]
    marker.color.a = color[3]

    return marker

def interpDiff(vive_gripper):
    '''Obtains dx+dy+dz difference between the gripper's and marker's xyz position.'''
    position_q = vive_gripper.pose.position
    current_pose = robot.get_actual_tcp_pose()
    dx = abs(position_q.x - current_pose[0])
    dy = abs(position_q.y - current_pose[1])
    dz = abs(position_q.z - current_pose[2])
    return dx+dy+dz

def nd_arr_pose_to_marker(nd_array_pose):
    '''Converts nd.array xyz positions to marker positions'''
    marker_position = geometry_msgs.msg.Point()
    marker_position.x = nd_array_pose[0]
    marker_position.y = nd_array_pose[1]
    marker_position.z = nd_array_pose[2]
    return marker_position

"""SETTINGS AND VARIABLES ________________________________________________________________"""

ROBOT_IP = '10.75.15.194'
# ROBOT_IP = '127.0.0.1'

ACCELERATION = 0.4  # Robot acceleration value
VELOCITY = 0.4  # Robot speed value

ACCELERATION_GRIPPER = 1.5
VELOCITY_GRIPPER = 1.5

initialize(config_path="./cfgs", job_name="teleop")
cfg = compose(config_name="teleop")


#Frame in URSIM is 'base' but in lab, 'base_link' is used whose x-y axes are in opposite direction.


# The Joint position the robot starts at
robot_startposition = (-0.1835673491, -1.446624104, 1.77286005, -1.90146142, -1.532696072, 1.339956641)

robotModel = URBasic.robotModel.RobotModel()
robot = URBasic.urScriptExt.UrScriptExt(host=ROBOT_IP,robotModel=robotModel)
print("Gripper initialization done")
joint_states_pub = rospy.Publisher('/joint_states', JointState, queue_size=10)

target_ee_marker = get_ee_marker("package://ur5_teleop_vive/mesh/hand.dae", [1.0, 0.64, 0.0, 0.3])
target_ee_marker_pub = rospy.Publisher('target_gripper', Marker, queue_size=10)


tcp_orient_thresh = 0.6 #Axis value read from the joystick
Thres4Interp = 0.06
step_size = 0.01 #in metres[m]

joint_states_msg = JointState()
joint_states_msg.name.extend(['shoulder_pan_joint', 'shoulder_lift_joint', 'elbow_joint','wrist_1_joint','wrist_2_joint', 'wrist_3_joint'])

# time.sleep(0.2)
rospy.init_node('gripper')
gripper = Gripper(True)
gripper.reset()
gripper.activate()
gripper_opened = 1
print("Gripper initialization done")

used_movej = 0

"""FUNCTIONS _____________________________________________________________________________"""
def callback(vive_gripper):
    # print("Entered callback function")
    global used_movej
    if used_movej == 1:
        robot.init_realtime_control()
        used_movej = 0
    
    
    joy_msg = rospy.wait_for_message('/vive_right', Joy)
    # print("joy msg: ", joy_msg)
    global gripper_opened

    current_pose = robot.get_actual_tcp_pose()
    print("Current pose: ", current_pose)

    pose_goal = geometry_msgs.msg.Pose()
    pose_goal = vive_gripper.pose

    target_ee_marker = copy.deepcopy(vive_gripper)
    target_ee_marker.color.r = 1.0
    target_ee_marker.color.g = 0.64
    target_ee_marker.color.b = 0.0
    target_ee_marker.color.a = 0.3


    orientation_q = vive_gripper.pose.orientation
    orientation_list = [orientation_q.x, orientation_q.y, orientation_q.z, orientation_q.w]
    (roll, pitch, yaw) = euler_from_quaternion (orientation_list)

    print("Pose from gripper",pose_goal.position.x, pose_goal.position.y, pose_goal.position.z )

    # step = 0.05
    # start_x = cfg['robot_ws']['x_mid'] - cfg['robot_ws']['x_len']/2
    # stop_x = cfg['robot_ws']['x_mid'] + cfg['robot_ws']['x_len']/2
    # start_y = cfg['robot_ws']['y_mid'] - cfg['robot_ws']['y_len']/2
    # stop_y = cfg['robot_ws']['y_mid'] + cfg['robot_ws']['y_len']/2
    # start_z = cfg['robot_ws']['z_mid'] - cfg['robot_ws']['z_len']/2
    # stop_z = cfg['robot_ws']['z_mid'] + cfg['robot_ws']['z_len']/2

    # for i in range(int(start_x / step), int(stop_x / step)):
    #     x = i * step
    #     for j in range(int(start_y / step), int(stop_y / step)):
    #         y = j*step
    #         for k in range(int(start_z / step), int(stop_z / step)):
    #             z = k*step
    #             xyz_coords = m3d.Vector(x, y, z)            
    
    xyz_coords = m3d.Vector(pose_goal.position.x, pose_goal.position.y, pose_goal.position.z)
    print("xyz_coords: ",xyz_coords )

    # tcp_rotation_rpy = [roll, pitch, yaw] #Vive Gripper/ Controller Pose

    # tcp_rotation_rpy = [0, math.radians(180), 0] # Testing Only
    # tcp_rotation_rpy = [0.08252318, current_pose[4], 0.03336271] # Top-Down pose
    tcp_rotation_rpy = [0.08252318, math.radians(180) , 0.03336271] # Top-Down pose

    # tcp_rotation_rvec = convert_rpy(tcp_rotation_rpy)
    tcp_orient = m3d.Orientation.new_euler(tcp_rotation_rpy, encoding='xyz')
    print("tcp_orient: ",tcp_orient )
    

    oriented_xyz = m3d.Transform(tcp_orient, xyz_coords)
    # print("oriented_xyz: ",oriented_xyz )
    
    goal = oriented_xyz.get_pose_vector()
    goal[-3:] = [current_pose[3], current_pose[4] , current_pose[5]]
    print("goal: ",goal )


    joint_states_msg.header = vive_gripper.header #ORIGINAL
    joint_states_msg.header.stamp = rospy.Time.now() #Testing ONLY
    joint_states_msg.position = robot.get_actual_joint_positions()
    joint_states_pub.publish(joint_states_msg)
    
    print("Marker color: ",vive_gripper.color.g )
    print("Difference between current and target pose: ", interpDiff(vive_gripper))
    

    # print("Joint position: ", qnear) #Does not work when Simulation is ON in URSIM
    # print("Current TCP Position: ", robot.get_actual_tcp_pose())
    
    target_ee_marker.header.stamp = rospy.Time.now()
    target_ee_marker.pose = vive_gripper.pose
   
                
    if (joy_msg.buttons[0]==1):

        if(interpDiff(vive_gripper)>Thres4Interp):
            # Calculate the total number of interpolation steps
            target_pose = vive_gripper.pose.position
            current_pose = robot.get_actual_tcp_pose()
            num_steps = int(np.linalg.norm([target_pose.x, target_pose.y, target_pose.z] - current_pose[:3]) / step_size)
            # num_steps = 20
            print("Current pose: ", current_pose)
            print("Num steps: ", num_steps)

            # Perform linear interpolation
            interpolated_position = np.linspace(current_pose[:3], [target_pose.x, target_pose.y, target_pose.z], num_steps)

            for position_intp in interpolated_position:
                # print("position_intp is: ", type(position_intp), " | type goal is: ", type(goal))
                pose_intp = [position_intp , goal[-3:]]
                pose_intp = np.concatenate(pose_intp)
                print("pose_intp",pose_intp)
                robot.set_realtime_pose(pose_intp)
                
                joint_states_msg.header.stamp = rospy.Time.now() #Testing ONLY
                joint_states_msg.position = robot.get_actual_joint_positions()
                joint_states_pub.publish(joint_states_msg)
                
                target_ee_marker.pose.position = nd_arr_pose_to_marker(pose_intp)
                target_ee_marker.header.stamp = rospy.Time.now()
                # Update the position of target gripper to that of the interpolated pose
                target_ee_marker_pub.publish(target_ee_marker)
                time.sleep(0.05)
        
        else:
            robot.set_realtime_pose(goal)
            target_ee_marker_pub.publish(target_ee_marker)
        used_movej = 0
    elif (joy_msg.axes[1] > tcp_orient_thresh):
        # Rotate the gripper clockwise
        used_movej = 1
        q_ee_rotated = joint_states_msg.position
        q_ee_rotated[-1] = q_ee_rotated[-1] + math.radians(10)
        robot.movej(q=q_ee_rotated, a= ACCELERATION_GRIPPER, v= VELOCITY_GRIPPER )
        # robot.init_realtime_control()
    elif (joy_msg.axes[1] < -tcp_orient_thresh):
        # Rotate the gripper anti-clockwise
        used_movej = 1
        q_ee_rotated = joint_states_msg.position
        q_ee_rotated[-1] = q_ee_rotated[-1] - math.radians(10)
        robot.movej(q=q_ee_rotated, a= ACCELERATION_GRIPPER, v= VELOCITY_GRIPPER )
        
    elif(gripper_opened == 0 and joy_msg.buttons[4]==1):
        print("Opening the gripper")
        gripper_opened = 1
        gripper.openGripper()
        time.sleep(1)
    elif (joy_msg.buttons[4]==1 and gripper_opened == 1):
        print("Closing the gripper")
        gripper_opened = 0
        gripper.closeGripper()
        time.sleep(1)

    
    
    
    




    # time.sleep(0.5) #Works OK
    # time.sleep(0.35)  #Better than 0.5
    time.sleep(0.30)



    # return prev_robot_pos
    # time.sleep(20)
    print("\n##########################################################\n")


def main():
    
    try:

        print(" ########## STARTED MAIN FUNCTION ##########")
        
        print(cfg)

        # initialise robot with URBasic
        print("initialising robot")

        robot.reset_error()
        print("robot initialised")
        time.sleep(1)

        # Move Robot to the midpoint of the lookplane
        robot.movej(q=robot_startposition, a= ACCELERATION, v= VELOCITY )
        print("Robot reached starting position")        

        time.sleep(5)

        robot.init_realtime_control()  # starts the realtime control loop on the Universal-Robot Controller

        time.sleep(2)
        
        # rospy.init_node('move_group_tutorial_ur5', anonymous=True)

        # vive_gripper_sub = message_filters.Subscriber('/vive_gripper', Marker)
        # vive_joy_sub = message_filters.Subscriber('/vive_right', Joy)
        # ts = message_filters.ApproximateTimeSynchronizer([vive_gripper_sub, vive_joy_sub], 1, 0.00999) # Changed code filters/ subscribers/ fs, queue_size, slop/ delay (in seconds) with which messages can be synchronized
        # ts.registerCallback(callback)

        vive_gripper_sub = rospy.Subscriber('/vive_gripper', Marker, callback, queue_size=1)

             
        time.sleep(1) # just a short wait to make sure everything is initialised
        rospy.spin()
        rospy.loginfo("################## USER DEBUG MESSAGE STARTED")


        print("exiting loop")
        robot.close()
        print('Robot close done')
        return
    except KeyboardInterrupt:
        print("closing robot connection")
        # Remember to always close the robot connection, otherwise it is not possible to reconnect
        robot.close()
        raise
        exit()

    except rospy.ROSInterruptException:  
        robot.close()
        raise
        
    

if __name__ == '__main__':
  main()
