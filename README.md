# UR5_VR_teleop

Control a UR5 robot using HTC Vive controllers.

## Installation Guidance

Before using this package, make sure you have the following prerequisites installed:

- Ubuntu 20.04 & ROS Noetic
- Robotiq gripper package

Follow these steps for installation:

1. Install URSIM by following the instructions provided in [URSim Installation Guide](https://github.com/githubuser0xFFFF/URSim_Install_Guides/tree/lubuntu-2004-ursim-5.12.2).

2. Install the Beta Version of SteamVR on Steam.

3. Change the null driver related settings:
    - Navigate to hidden files in your home directory and go to `.steam`.
    - Find `default.vrsettings` and make the following changes:
        - `"activateMultipleDrivers": true`
        - `"requireHmd": false`
        - `"forcedDriver": "null"`
    - Find `default.vrsettings` (the null driver one) and change `"enable": true`.

## Setting Up Base Stations and Controllers

1. Set up Base Stations A and B, ensuring they are approximately 30 degrees apart and facing the Vive controller. Maintain a minimum distance of 60cm between the base stations and the Vive controller.

2. In the Steam VR app, you should see that 2 base stations and a controller are connected, indicated by their respective symbols.

## Calibration

For calibration, open `cfgs/teleop.yaml`. This file contains the position/calibration settings for the specific environment, which can be adjusted based on the environmental conditions. Use Rviz for calibration tasks.

## How to Run the System

1. Start ROS core: `roscore`

2. Disable simulation time: `rosparam set use_sim_time false`

### Real Testing

3. Run SteamVR.

4. Launch the HTC Vive teleop package: `roslaunch htc_vive_teleop_stuff vive_tf_joy_and_ps.launch`

5. Source your workspace: `source ~/Documents/ur5_teleop_ws/devel/setup.bash`

6. Launch the UR5 robot: `roslaunch ur5_teleop_vive ur5_bringup.launch`

### Simulation Testing

7. Start the UR5 simulation: `/opt/ursim/5.12.2/start-ursim.sh UR5`

8. If you want to use rqt marker-based control, run: `rosrun rqt_virtual_joy rqt_virtual_joy`

9. Run the provided scripts for simulation testing:
   - `cd ~/Documents/ur5_teleop_ws/src/ur5_teleop_vive/src/vive_sim_test`
   - `python3 dummy_static_tf_pub.py`
   - `cd ~/Documents/ur5_teleop_ws/src/htc_vive_teleop_stuff/scripts/`
   - `python3 frame_as_posestamped.py right_controller hmd 30`

### Simulation and Real Testing

10. Run the UR5 teleop script: `cd ~/Documents/ur5_teleop_ws/src/ur5_teleop_vive/src/ && python3 vive_ur5_teleop.py`

11. Ensure proper permissions for `/dev/ttyUSB0`: `sudo chmod 777 /dev/ttyUSB0`

12. Install the required Python package: `pip3 install pymodbus==2.1.0`

13. Run the Robotiq gripper control node:
    - Use `roscd` to navigate to `robotiq_c_model_control/nodes/`
    - Execute `python3 CModelRtuNode.py /dev/ttyUSB0`
    - If it doesn't work, go to the directory and run `python3 CModelRtuNode.py /dev/ttyUSB0`

14. For recording data, use `rosbag record` with the `/ee_pose` topic.

## Postprocessing Data

To analyze data, run the `2cm_gap.py` script, which prints data after every 2 cm of travel from the current pose to the goal pose. The script is located in `~/UR5_VR_teleop/src/ur5_teleop_vive/src`.

To follow a trajectory using the robot class, run:
```bash
source ~/Documents/ur5_teleop_ws/devel/setup.bash
cd ~/Documents/ur5_teleop_ws/src/ur5_teleop_vive/src/
python3 ur_follow_using_class.py

