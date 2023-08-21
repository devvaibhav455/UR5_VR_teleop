import tf, tf2_ros
import copy
import numpy as np

import rospy
from geometry_msgs.msg import PoseStamped, TwistStamped
from sensor_msgs.msg import Joy
from visualization_msgs.msg import Marker
from tf.transformations import euler_from_quaternion, quaternion_from_euler


import hydra
from hydra import compose, initialize
from omegaconf import OmegaConf
import math



class ViveMarkerPub:

	def __init__(self, cfg):
		self.cfg = cfg
	
		self.base_frame = 'base'
		self.ee_frame = 'tool0'
		
		self.tl = tf.TransformListener()
		self.tb = tf.TransformBroadcaster()

		self.tf2_Buffer = tf2_ros.Buffer(rospy.Duration(secs=2))
		self.tf2_listener = tf2_ros.TransformListener(self.tf2_Buffer)


		self.gripper_state = 'close'
		self.last_joy = None
		
		self.vive_pose = PoseStamped()
		self.vive_origin_pose = PoseStamped()
		self.vive_origin_pose.pose.orientation.w = 1.0

		self.ee_pose = PoseStamped()
		self.ee_pose_origin = PoseStamped()
		self.ee_pose_origin.pose.orientation.w = 1.0

		self.ee_marker = self.get_ee_marker("package://ur5_teleop_vive/mesh/hand.dae", [0.0, 1.0, 0.0, 0.6])
		self.ee_marker_pub = rospy.Publisher('vive_gripper', Marker, queue_size=10)

		self.robot_ws_pub = rospy.Publisher('/robot_ws_marker', Marker, queue_size=10)
		self.robot_ws_marker = Marker()

		self.robot_ws_marker.type = Marker.CUBE
		self.robot_ws_marker.action = self.robot_ws_marker.ADD  # Set the marker action to add

		self.robot_ws_marker.pose.orientation.x = 0.0  # Set the cube's orientation in x
		self.robot_ws_marker.pose.orientation.y = 0.0  # Set the cube's orientation in y
		self.robot_ws_marker.pose.orientation.z = 0.0  # Set the cube's orientation in z
		self.robot_ws_marker.pose.orientation.w = 1.0  # Set the cube's orientation in w
		self.robot_ws_marker.color.r = 0.0  # Set the cube's color (red component)
		self.robot_ws_marker.color.g = 1.0  # Set the cube's color (green component)
		self.robot_ws_marker.color.b = 0.0  # Set the cube's color (blue component)
		self.robot_ws_marker.color.a = 0.3  # Set the cube's color (alpha component)
		self.robot_ws_marker.lifetime = rospy.Duration()  # Set the marker's lifetime
		


		
		self.target_pose_45 = PoseStamped()
		self.target_pose_45.pose.orientation.w = 1.0

		self.dist_threshold = 5/100 #Threshold in metres

		print(" ######### INIT done  #########")

	def get_ee_marker(self, mesh_resource, color):
		marker = Marker()

		marker = Marker()
		marker.header.frame_id = self.base_frame
		marker.header.stamp  = rospy.get_rostime()
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

	def get_ee_pose(self):
		# do_frame_exist = self.tl.waitForTransform(self.base_frame, self.ee_frame, rospy.Time(), rospy.Duration(5.0))
		# print("Frame exists", do_frame_exist )
		required_tf = self.tf2_Buffer.lookup_transform(self.base_frame, self.ee_frame, rospy.Time(), rospy.Duration(1))
		# print("Frame exists", required_tf )
		
		if required_tf != None:
		# if self.tl.frameExists(self.base_frame) and self.tl.frameExists(self.ee_frame):
			t = self.tl.getLatestCommonTime(self.base_frame, self.ee_frame)
			position, quaternion = self.tl.lookupTransform(self.base_frame, self.ee_frame, t)
			# print("Returning position: ", position, " | quaternion: ", quaternion)
			return position, quaternion
		raise Exception("tf not avaialble between {} and {}".format(self.base_frame, self.ee_frame))

	def apply_offset(self, pose):
		pose.position.y = -pose.position.y
		pose.position.x = -pose.position.x
		if self.cfg['sim'] == 'true':
			pose.position.x += self.cfg['manipulation']['offsets_sim']['trans_x']
			pose.position.y += self.cfg['manipulation']['offsets_sim']['trans_y']
			pose.position.z += self.cfg['manipulation']['offsets_sim']['trans_z']

			offset_quat = tf.transformations.quaternion_from_euler(
			np.deg2rad(self.cfg['manipulation']['offsets_sim']['rot_x']),
			np.deg2rad(self.cfg['manipulation']['offsets_sim']['rot_y']),
			np.deg2rad(self.cfg['manipulation']['offsets_sim']['rot_z']))
		else:
			pose.position.x += self.cfg['manipulation']['offsets_real']['trans_x']
			pose.position.y += self.cfg['manipulation']['offsets_real']['trans_y']
			pose.position.z += self.cfg['manipulation']['offsets_real']['trans_z']

			offset_quat = tf.transformations.quaternion_from_euler(
			np.deg2rad(self.cfg['manipulation']['offsets_real']['rot_x']),
			np.deg2rad(self.cfg['manipulation']['offsets_real']['rot_y']),
			np.deg2rad(self.cfg['manipulation']['offsets_real']['rot_z']))

		pose_quat = [pose.orientation.x,
					 pose.orientation.y,
					 pose.orientation.z,
					 pose.orientation.w]


		rotated = tf.transformations.quaternion_multiply(offset_quat, pose_quat)
		norm = np.linalg.norm(np.array(rotated), ord=2)
		pose.orientation.x = rotated[2] # / norm
		pose.orientation.y = rotated[1] # / norm
		pose.orientation.z = -rotated[0] # / norm
		pose.orientation.w = rotated[3] # / norm

		return pose

	def is_point_inside_cuboid(self, point, center, lengths):
		"""
		Function to test if a given point lies within a cuboid.

		Inputs:
			point: a list or tuple representing the Cartesian coordinates of the point [x, y, z]
			center: a list or tuple representing the Cartesian coordinates of the cuboid center [x_center, y_center, z_center]
			lengths: a list or tuple representing the lengths of the cuboid in the x, y, and z directions [length_x, length_y, length_z]

		Returns:
			True if the point lies within the cuboid, False otherwise.
		"""
		x, y, z = point
		x_center, y_center, z_center = center
		length_x, length_y, length_z = lengths

		x_min = x_center - length_x / 2
		x_max = x_center + length_x / 2
		y_min = y_center - length_y / 2
		y_max = y_center + length_y / 2
		z_min = z_center - length_z / 2
		z_max = z_center + length_z / 2

		if x_min <= x <= x_max and y_min <= y <= y_max and z_min <= z <= z_max:
			return True
		else:
			return False

	
	def callback(self, joy, pose):
		
		# Publishing the Gripper visualization marker
		

		
		# Hardcoding the top-down pose of the gripper
		self.ee_marker.pose = self.apply_offset(pose.pose)

	
		self.ee_marker.pose.orientation.x = 1.0
		self.ee_marker.pose.orientation.y = 0.0
		self.ee_marker.pose.orientation.z = 0.0
		self.ee_marker.pose.orientation.w = 0.0
		


		self.ee_marker.header.stamp = rospy.get_rostime()
		
		point = [self.ee_marker.pose.position.x , self.ee_marker.pose.position.y, self.ee_marker.pose.position.z]
		robot_ws_center = [self.cfg['robot_ws']['x_mid'], self.cfg['robot_ws']['y_mid'], self.cfg['robot_ws']['z_mid'] ]
		robot_ws_len = [self.cfg['robot_ws']['x_len'], self.cfg['robot_ws']['y_len'], self.cfg['robot_ws']['z_len'] ]
		
		if (self.is_point_inside_cuboid(point, robot_ws_center, robot_ws_len)):
			self.ee_marker.color.r = 0.0
			self.ee_marker.color.g = 1.0
		else:
			self.ee_marker.color.r = 1.0
			self.ee_marker.color.g = 0.0


		self.ee_marker_pub.publish(self.ee_marker)
		self.tb.sendTransform((self.ee_marker.pose.position.x, self.ee_marker.pose.position.y, self.ee_marker.pose.position.z),
							  (self.ee_marker.pose.orientation.x, self.ee_marker.pose.orientation.y, self.ee_marker.pose.orientation.z, self.ee_marker.pose.orientation.w),
							  rospy.Time.now(),
							  "marker", self.base_frame)

						

		# Publishing the Robot workspace
		# robot_ws_marker.header = vive_gripper.header #ORIGINAL
		self.robot_ws_marker.header = pose.header #Testing ONLY
		self.robot_ws_marker.header.frame_id = self.base_frame #Testing ONLY

		# print(robot_ws_marker)
		self.robot_ws_pub.publish(self.robot_ws_marker)

# @hydra.main(config_path="../cfgs/teleop.yaml")

def main():
	
	print(" ########## STARTED MAIN FUNCTION ##########")
	initialize(config_path="./cfgs", job_name="teleop")
	cfg = compose(config_name="teleop")
	print(cfg)

	rospy.init_node('vive_ur5_teleop', anonymous=True)
	teleop = ViveMarkerPub(cfg)

	teleop.robot_ws_marker.pose.position.x = cfg['robot_ws']['x_mid']  # Set the cube's position in x
	teleop.robot_ws_marker.pose.position.y = cfg['robot_ws']['y_mid']  # Set the cube's position in y
	teleop.robot_ws_marker.pose.position.z = cfg['robot_ws']['z_mid']  # Set the cube's position in z
	teleop.robot_ws_marker.scale.x = cfg['robot_ws']['x_len']  # Set the cube's scale in x
	teleop.robot_ws_marker.scale.y = cfg['robot_ws']['y_len']  # Set the cube's scale in y
	teleop.robot_ws_marker.scale.z = cfg['robot_ws']['z_len']  # Set the cube's scale in z

	teleop.last_joy = rospy.wait_for_message('/vive_right', Joy)

	print(" ########## Ready to go ##########")
	while not rospy.is_shutdown():
		try:
			joy = rospy.wait_for_message('/vive_right', Joy)
			pose = rospy.wait_for_message('/right_controller_as_posestamped', PoseStamped)
			teleop.callback(joy, pose)

		except KeyboardInterrupt:
			print("Shutting down vive_ur5_teleop")

if __name__ == '__main__':
	main()