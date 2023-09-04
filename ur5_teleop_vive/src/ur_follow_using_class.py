import URBasic
import math
import numpy as np
import sys
import cv2
import time
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
from ur5_teleop_vive.msg import xyzrpy
import tf
import tf2_ros

class ur_follow_vive:
    def __init__(self):
        
        initialize(config_path="./cfgs", job_name="teleop")
        self.cfg = compose(config_name="teleop")

        self.vive_gripper_data = None
        self.vive_joy_data = None

        # Create subscribers and associate them with callback functions
        self.vive_gripper_data_sub = rospy.Subscriber('/vive_gripper', Marker, self.vive_gripper_cb, queue_size=1)
        self.vive_joy_sub = rospy.Subscriber('/vive_right', Joy, self.vive_joy_cb, queue_size=1)

        """SETTINGS AND VARIABLES ________________________________________________________________"""

        self.ROBOT_IP = '127.0.0.1' if self.cfg['sim'] == 'true' else '10.75.15.194'
        print("Robot IP: ", self.ROBOT_IP)

        self.ACCELERATION = 0.4  # Robot acceleration value
        self.VELOCITY = 0.4  # Robot speed value

        self.ACCELERATION_GRIPPER = 1.5
        self.VELOCITY_GRIPPER = 1.5

        


        #Frame in URSIM is 'base' but in lab, 'base_link' is used whose x-y axes are in opposite direction.

        # The Joint position the robot starts at
        self.robot_startposition = (-0.1835673491, -1.446624104, 1.77286005, -1.90146142, -1.532696072, 1.339956641)

        self.robotModel = URBasic.robotModel.RobotModel()
        self.robot = URBasic.urScriptExt.UrScriptExt(host=self.ROBOT_IP,robotModel=self.robotModel)

        self.robot.reset_error()
        print("robot initialised")
        time.sleep(1)

        # Move Robot to the midpoint of the lookplane
        self.robot.movej(q=self.robot_startposition, a= self.ACCELERATION, v= self.VELOCITY )
        print("Robot reached starting position")  
        

        time.sleep(5)

        self.robot.init_realtime_control()  # starts the realtime control loop on the Universal-Robot Controller

        time.sleep(2)
        print("Gripper initialization done")
        self.joint_states_pub = rospy.Publisher('/joint_states', JointState, queue_size=10)

        self.target_ee_marker = self.get_ee_marker("package://ur5_teleop_vive/mesh/hand.dae", [1.0, 0.64, 0.0, 0.3])
        self.target_ee_marker_pub = rospy.Publisher('target_gripper', Marker, queue_size=10)


        self.tcp_orient_thresh = 0.6 #Axis value read from the joystick
        self.Thres4Interp = 0.10
        self.step_size = 0.02 #in metres[m]

        self.joint_states_msg = JointState()
        self.joint_states_msg.name.extend(['shoulder_pan_joint', 'shoulder_lift_joint', 'elbow_joint','wrist_1_joint','wrist_2_joint', 'wrist_3_joint'])

        self.ee_pose_pub = rospy.Publisher('/ee_pose', xyzrpy, queue_size=10)
        self.ee_pose_msg = xyzrpy()
        print(self.ee_pose_msg)
        self.ee_pose_msg.header = Header()
        self.ee_pose_msg.header.frame_id = 'base'
        # print("ee pose message is", self.ee_pose_msg)

        self.publish_ee_pose_msg()      

        self.min_z = -0.101

        # time.sleep(0.2)
        self.gripper_opened = 1
        if self.cfg['sim'] == 'false':
            self.gripper = Gripper(True)
            self.gripper.reset()
            self.gripper.activate()
            print("Gripper initialization done")

        self.used_movej = 0

        self.tf2_buffer = tf2_ros.Buffer(rospy.Duration(1200.0)) #tf buffer length
        self.tf2_listener = tf2_ros.TransformListener(self.tf2_buffer)


    def vive_gripper_cb(self, msg):
        self.vive_gripper_data = msg

    def vive_joy_cb(self, msg):
        self.joy_data = msg

    def publish_ee_pose_msg(self):
        current_pose = self.robot.get_actual_tcp_pose()
        # print("Current pose: ", current_pose)
        self.ee_pose_msg.header.stamp = rospy.Time.now()
        self.ee_pose_msg.x = current_pose[0]
        self.ee_pose_msg.y = current_pose[1]
        self.ee_pose_msg.z = current_pose[2]
        self.ee_pose_msg.roll = current_pose[3]
        self.ee_pose_msg.pitch = current_pose[4]
        self.ee_pose_msg.yaw = current_pose[5]
        
        self.ee_pose_pub.publish(self.ee_pose_msg)

    def control_action(self):


        current_pose = self.robot.get_actual_tcp_pose()


        


        pose_goal = geometry_msgs.msg.Pose()
        pose_goal = self.vive_gripper_data.pose

        target_ee_marker = copy.deepcopy(self.vive_gripper_data)
        target_ee_marker.color.r = 1.0
        target_ee_marker.color.g = 0.64
        target_ee_marker.color.b = 0.0
        target_ee_marker.color.a = 0.3


        orientation_q = self.vive_gripper_data.pose.orientation
        orientation_list = [orientation_q.x, orientation_q.y, orientation_q.z, orientation_q.w]
        (roll, pitch, yaw) = euler_from_quaternion (orientation_list)

        # print("Pose from gripper",pose_goal.position.x, pose_goal.position.y, pose_goal.position.z )          
        
        xyz_coords = m3d.Vector(pose_goal.position.x, pose_goal.position.y, pose_goal.position.z)
        # print("xyz_coords: ",xyz_coords )

        # tcp_rotation_rpy = [roll, pitch, yaw] #Vive Gripper/ Controller Pose

        # tcp_rotation_rpy = [0, math.radians(180), 0] # Testing Only
        # tcp_rotation_rpy = [0.08252318, current_pose[4], 0.03336271] # Top-Down pose
        tcp_rotation_rpy = [0.08252318, math.radians(180) , 0.03336271] # Top-Down pose

        # tcp_rotation_rvec = convert_rpy(tcp_rotation_rpy)
        tcp_orient = m3d.Orientation.new_euler(tcp_rotation_rpy, encoding='xyz')
        # print("tcp_orient: ",tcp_orient )
        

        oriented_xyz = m3d.Transform(tcp_orient, xyz_coords)
        # print("oriented_xyz: ",oriented_xyz )
        
        goal = oriented_xyz.get_pose_vector()
        
        if self.cfg['sim'] == "false":
            # Robot's goal in z should be repored + marker - actual
            # actual = reported + 175 mm
            # 175.0 mm is set as Dian's TCP
            # transform = self.tf2_buffer.lookup_transform('wrist_3_link',
			# 										 'base',
			# 										 rospy.Time(0), #get the tf at first available time
			# 										 rospy.Duration(1.0)) #wait for 1 second
            # print(transform)
            goal[2] = goal[2] - 0.175
        
        goal[-3:] = [current_pose[3], current_pose[4] , current_pose[5]]
        # print("goal: ",goal )
        # print("Pose from gripper",pose_goal.position.x, pose_goal.position.y, pose_goal.position.z )          


        self.joint_states_msg.header = self.vive_gripper_data.header #ORIGINAL
        self.joint_states_msg.header.stamp = rospy.Time.now() #Testing ONLY
        self.joint_states_msg.position = self.robot.get_actual_joint_positions()
        # print("Joint States: ", self.joint_states_msg.position)
        self.joint_states_pub.publish(self.joint_states_msg)
        
        # print("Marker color: ",self.vive_gripper_data.color.g )
        # print("Difference between current and target pose: ", self.interpDiff(self.vive_gripper_data))
        

        # print("Joint position: ", qnear) #Does not work when Simulation is ON in URSIM
        print("Current TCP Position: ", self.robot.get_actual_tcp_pose())
        
        target_ee_marker.header.stamp = rospy.Time.now()
        target_ee_marker.pose = self.vive_gripper_data.pose
        
        # target_ee_marker.pose.position.z = goal[2]

                
        if (self.joy_data.buttons[0]==1 and goal[2] > self.min_z):
            if self.used_movej == 1:
                self.robot.init_realtime_control()
                time.sleep(2)
                self.used_movej = 0
            
            if(self.interpDiff(self.vive_gripper_data) > self.Thres4Interp):
                # Calculate the total number of interpolation steps
                # target_pose = self.vive_gripper_data.pose.position

                # current_pose = self.robot.get_actual_tcp_pose()
                num_steps = int(np.linalg.norm([goal[0], goal[1], goal[2]] - current_pose[:3]) / self.step_size)
                # num_steps = 20
                # print("Current pose: ", current_pose)
                print("Using interpolation | Num steps: ", num_steps)

                # Perform linear interpolation
                interpolated_position = np.linspace(current_pose[:3], [goal[0], goal[1], goal[2]], num_steps)

                for position_intp in interpolated_position:
                    # print("position_intp is: ", type(position_intp), " | type goal is: ", type(goal))
                    pose_intp = [position_intp , goal[-3:]]
                    pose_intp = np.concatenate(pose_intp)
                    print("pose_intp",pose_intp)
                    self.robot.set_realtime_pose(pose_intp)
                    
                    self.joint_states_msg.header.stamp = rospy.Time.now() #Testing ONLY
                    self.joint_states_msg.position = self.robot.get_actual_joint_positions()
                    self.joint_states_pub.publish(self.joint_states_msg)
                    
                    target_ee_marker.pose.position = self.nd_arr_pose_to_marker(pose_intp)
                    # print("Pose from gripper",pose_goal.position.x, pose_goal.position.y, pose_goal.position.z )          
                    # print("target_ee_marker.pose: ", target_ee_marker.pose, "\n")
                    target_ee_marker.header.stamp = rospy.Time.now()
                    # Update the position of target gripper to that of the interpolated pose
                    self.target_ee_marker_pub.publish(target_ee_marker)
                    self.publish_ee_pose_msg()
                    # rospy.sleep(0.05)
                    time.sleep(0.10)
                print("\n##########################################################\n")
            
            else:
                self.robot.set_realtime_pose(goal)
                print("Not using interpolation")
                # print("Pose from gripper",pose_goal.position.x, pose_goal.position.y, pose_goal.position.z )          
                # print("target_ee_marker.pose: ", target_ee_marker.pose)
                self.target_ee_marker_pub.publish(target_ee_marker)
                self.publish_ee_pose_msg()
                print("\n##########################################################\n")
            self.used_movej = 0
        elif (self.joy_data.axes[1] > self.tcp_orient_thresh):
            # Rotate the gripper clockwise
            self.used_movej = 1
            q_ee_rotated = self.joint_states_msg.position
            q_ee_rotated[-1] = q_ee_rotated[-1] + math.radians(10)
            self.robot.movej(q=q_ee_rotated, a= self.ACCELERATION_GRIPPER, v= self.VELOCITY_GRIPPER )
            self.publish_ee_pose_msg()
            # robot.init_realtime_control()
        elif (self.joy_data.axes[1] < -self.tcp_orient_thresh):
            # Rotate the gripper anti-clockwise
            self.used_movej = 1
            q_ee_rotated = self.joint_states_msg.position
            q_ee_rotated[-1] = q_ee_rotated[-1] - math.radians(10)
            self.robot.movej(q=q_ee_rotated, a= self.ACCELERATION_GRIPPER, v= self.VELOCITY_GRIPPER )
            self.publish_ee_pose_msg()
            
        elif(self.gripper_opened == 0 and self.joy_data.buttons[4]==1):
            print("Opening the gripper")
            self.gripper_opened = 1
            self.gripper.openGripper()
            time.sleep(1)
        elif (self.joy_data.buttons[4]==1 and self.gripper_opened == 1):
            print("Closing the gripper")
            self.gripper_opened = 0
            self.gripper.closeGripper()
            time.sleep(1)

        # print("\n##########################################################\n")
        


    def get_ee_marker(self, mesh_resource, color):
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

    def interpDiff(self,vive_gripper):
        '''Obtains dx+dy+dz difference between the gripper's and marker's xyz position.'''
        position_q = vive_gripper.pose.position
        current_pose = self.robot.get_actual_tcp_pose()
        dx = abs(position_q.x - current_pose[0])
        dy = abs(position_q.y - current_pose[1])
        dz = abs(position_q.z - current_pose[2] - 0.175)
        return dx+dy+dz

    def nd_arr_pose_to_marker(self, nd_array_pose):
        '''Converts nd.array xyz positions to marker positions'''
        marker_position = geometry_msgs.msg.Point()
        marker_position.x = nd_array_pose[0]
        marker_position.y = nd_array_pose[1]
        marker_position.z = nd_array_pose[2] + 0.175
        return marker_position



def main():
    
    rospy.init_node('my_node')
    my_object = ur_follow_vive()
    print(" ################# READY TO CONTROL #################")
    time.sleep(5)
    my_object.robot.close()

    while not rospy.is_shutdown():
        try:
            # Access class variables and perform control action
            my_object.control_action()
            # ...

            # Sleep to control the rate at which the loop executes
            rospy.sleep(0.01)
        except KeyboardInterrupt:
            print("closing robot connection")
            time.sleep(3)
            # Remember to always close the robot connection, otherwise it is not possible to reconnect
            my_object.robot.close()
            exit()

if __name__ == '__main__':
    main()
