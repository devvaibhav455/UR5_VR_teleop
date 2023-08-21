#!/usr/bin/env python

# Software License Agreement (BSD License)
#
# Copyright (c) 2012, Robotiq, Inc.
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
#
#  * Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
#  * Redistributions in binary form must reproduce the above
#    copyright notice, this list of conditions and the following
#    disclaimer in the documentation and/or other materials provided
#    with the distribution.
#  * Neither the name of Robotiq, Inc. nor the names of its
#    contributors may be used to endorse or promote products derived
#    from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
# FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
# COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
# INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
# BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
# LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
# ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.
#
# Copyright (c) 2012, Robotiq, Inc.
# Revision $Id$

"""@package docstring
ROS node for controling a Robotiq S-Model gripper using the Modbus TCP protocol.

The script takes as an argument the IP address of the gripper. It initializes a baseSModel object and adds a comModbusTcp client to it. It then loops forever, reading the gripper status and updating its command. The gripper status is published on the 'SModelRobotInput' topic using the 'SModel_robot_input' msg type. The node subscribes to the 'SModelRobotOutput' topic for new commands using the 'SModel_robot_output' msg type. Examples are provided to control the gripper (SModelSimpleController.py) and interpreting its status (SModelStatusListener.py).
"""

import sys
import os
from robotiq_s_model_control.msg import _SModel_robot_output as outputMsg
from robotiq_s_model_control.msg import _SModel_robot_input as inputMsg
import robotiq_modbus_tcp.comModbusTcp
import robotiq_s_model_control.baseSModel
import rospy
import roslib
roslib.load_manifest('robotiq_s_model_control')
roslib.load_manifest('robotiq_modbus_tcp')


def mainLoop(address):

    # Gripper is a S-Model with a TCP connection
    gripper = robotiq_s_model_control.baseSModel.robotiqBaseSModel()
    gripper.client = robotiq_modbus_tcp.comModbusTcp.communication()

    # We connect to the address received as an argument
    gripper.client.connectToDevice(address)

    rospy.init_node('robotiqSModel')

    # The Gripper status is published on the topic named 'SModelRobotInput'
    pub = rospy.Publisher('SModelRobotInput', inputMsg.SModel_robot_input)

    # The Gripper command is received from the topic named 'SModelRobotOutput'
    rospy.Subscriber('SModelRobotOutput',
                     outputMsg.SModel_robot_output, gripper.refreshCommand)

    # We loop
    while not rospy.is_shutdown():

        # Get and publish the Gripper status
        status = gripper.getStatus()
        pub.publish(status)

        # Wait a little
        rospy.sleep(0.05)

        # Send the most recent command
        gripper.sendCommand()

        # Wait a little
        rospy.sleep(0.05)


if __name__ == '__main__':
    try:
        # TODO: Add verification that the argument is an IP address
        mainLoop(sys.argv[1])
    except rospy.ROSInterruptException:
        pass
