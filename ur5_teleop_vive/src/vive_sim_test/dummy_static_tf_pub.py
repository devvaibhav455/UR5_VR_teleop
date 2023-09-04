#!/usr/bin/env python

import rospy
import tf2_ros
from geometry_msgs.msg import TransformStamped

import copy
import math

#Interesting: https://answers.ros.org/question/287469/unable-to-publish-multiple-static-transformations-using-tf/

if __name__ == '__main__':
    rospy.init_node('static_tf_publisher')

    static_tf_publisher_1 = tf2_ros.StaticTransformBroadcaster()
    static_tf_publisher_2 = tf2_ros.StaticTransformBroadcaster()
    static_tf_publisher_3 = tf2_ros.StaticTransformBroadcaster()

    br = tf2_ros.TransformBroadcaster()
    transforms = []

    static_transformStamped_1 = TransformStamped()
    
    static_transformStamped_1.header.frame_id = 'world'
    static_transformStamped_1.child_frame_id = 'right_controller'
    static_transformStamped_1.transform.translation.x = 1.0
    static_transformStamped_1.transform.translation.y = 2.0
    static_transformStamped_1.transform.translation.z = 0.0
    static_transformStamped_1.transform.rotation.x = 0.0
    static_transformStamped_1.transform.rotation.y = 0.0
    static_transformStamped_1.transform.rotation.z = 0.0
    static_transformStamped_1.transform.rotation.w = 1.0

    

    # print(static_transformStamped_1)
    # print(static_transformStamped_2)
    # print(static_transformStamped_3)

    # transforms.append(static_transformStamped_1)
    # transforms.append(static_transformStamped_2)
    # transforms.append(static_transformStamped_3)

    # rospy.spin()
    t = 0
    while not rospy.is_shutdown():


    # start = 0.0
    # stop = 0.4
    # step = 0.05

    # for i in range(int(start / step), int(stop / step)):
        # x = i * step
    
        t = t+1
        static_transformStamped_1.header.stamp = rospy.Time.now()

        static_transformStamped_2 = copy.deepcopy(static_transformStamped_1)
        
        # static_transformStamped_2.transform.translation.x = 0
        # static_transformStamped_2.transform.translation.y = 0
        # static_transformStamped_2.transform.translation.z = 0
        
        static_transformStamped_2.transform.translation.x = 0
        # static_transformStamped_2.transform.translation.y = 0.25*math.sin(t/50) 
        # static_transformStamped_2.transform.translation.z = 0.25*math.sin(t/50)

        static_transformStamped_2.transform.translation.y = 0 
        static_transformStamped_2.transform.translation.z = -0.5
        
        static_transformStamped_2.transform.rotation.x = 1e-6
        static_transformStamped_2.transform.rotation.y = 1e-6
        static_transformStamped_2.transform.rotation.z = 1e-6
        static_transformStamped_2.transform.rotation.w = 1



        static_transformStamped_2.child_frame_id = 'hmd'
        
        static_transformStamped_3 = copy.deepcopy(static_transformStamped_1)
        static_transformStamped_3.transform.translation.x = 3.0
        static_transformStamped_3.child_frame_id = 'lighthouse_0'
    
        br.sendTransform([static_transformStamped_1, static_transformStamped_2, static_transformStamped_3])
        rospy.Rate(5).sleep()

    # static_tf_publisher_1.sendTransform(static_transformStamped_1)
    # static_tf_publisher_2.sendTransform(static_transformStamped_2)
    # static_tf_publisher_3.sendTransform(static_transformStamped_3)

