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


rospy.init_node('gripper')
gripper = Gripper(True)
gripper.reset()
gripper.activate()
Gripper_trigger = 0
print("Gripper initialization done")

time.sleep(5)
gripper.closeGripper()

time.sleep(5)
gripper.openGripper()

