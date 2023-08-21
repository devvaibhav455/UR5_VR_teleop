execute_process(COMMAND "/home/sid/Documents/UR5_VR_teleop/build/robotiq/robotiq_c_model_control/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/sid/Documents/UR5_VR_teleop/build/robotiq/robotiq_c_model_control/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
