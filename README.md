# UR5_VR_teleop
Operate UR5 robot using HTC Vive controller


############################################
Installation Guidance
############################################
-Ubuntu 20.04 & Ros Noetic 
-Gripper robotiq package
-Follow the steps given in this link for installation of URSIM
    https://github.com/githubuser0xFFFF/URSim_Install_Guides/tree/lubuntu-2004-ursim-5.12.2

-Install Beta Version of SteamVR on steam.
-Changing the null driver related stuff:
1) Go to hidden files in Home, go to .steam    
2) Search for default.vrsettings and change "activateMultipleDrivers": true, "requireHmd": false, "forcedDriver": "null"
3) Search for default.vrsettings(null driver one) and change "enable": true
4) there are just 2 default.vrsetting both of them has to be changed like we showed. 

#####################################
Setting Base Station and controller
#####################################
-Setting Up Base station A and B, Such that they approx 30 Degree angle point towards each othe and the vive controller. Give minimum 60cm distance between the base station and vive controller.

Steam VR app should show 2 base station and controller been connected with their symbol.


####################################
For Calibration
####################################
Open cfgs/teleop.yaml
It contains how the position/calibration for the specific environment should be, can be changed as per the environment conditions. Use Rviz for this calibration task.



########################
How to run the System
########################
roscore

rosparam set use_sim_time false

########################################################
 REAL TESTING ONLY
########################################################

Run SteamVR

roslaunch htc_vive_teleop_stuff vive_tf_joy_and_ps.launch

########################################################


source ~/Documents/ur5_teleop_ws/devel/setup.bash
roslaunch ur5_teleop_vive ur5_bringup.launch 




########################################################
 SIMULATION TESTING ONLY
########################################################

/opt/ursim/5.12.2/start-ursim.sh UR5
#### If you want to use rqt marker based control:
rosrun rqt_virtual_joy rqt_virtual_joy

cd ~/Documents/ur5_teleop_ws/src/ur5_teleop_vive/src/vive_sim_test
python3 dummy_static_tf_pub.py

cd ~/Documents/ur5_teleop_ws/src/htc_vive_teleop_stuff/scripts/
python3 frame_as_posestamped.py right_controller hmd 30
##If you want to use vr controller with ursim:
change the ip address in the code to the ip of the laptop.
And run same things as real test

 
########################################################
 SIMULATION AND REAL TESTING
########################################################


cd ~/Documents/ur5_teleop_ws/src/ur5_teleop_vive/src/
python3 vive_ur5_teleop.py

sudo chmod 777 /dev/ttyUSB0


pip3 install pymodbus==2.1.0
rosrun robotiq_c_model_control CModelRtuNode.py /dev/ttyUSB0

OR

source ~/Documents/ur5_teleop_ws/devel/setup.bash
roscd robotiq_c_model_control
cd nodes/
python3 CModelRtuNode.py /dev/ttyUSB0
# If it doesn't work, need to go to the directory and run using python3 CModelRtuNode.py /dev/ttyUSB0

For recording the data rosbag record the /ee_pose topic.



######################################
For Postprocessing data 
######################################

we should run 2cm_gap.py 
which will print the data after every 2 cm of travel from current pose to the goal pose. 
~/UR5_VR_teleop/src/ur5_teleop_vive/src



source ~/Documents/ur5_teleop_ws/devel/setup.bash
cd ~/Documents/ur5_teleop_ws/src/ur5_teleop_vive/src/
python3 ur_follow_using_class.py
