# Install script for directory: /home/sid/Documents/UR5_VR_teleop/src/robotiq/robotiq_c_model_control

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/sid/Documents/UR5_VR_teleop/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/robotiq_c_model_control/msg" TYPE FILE FILES
    "/home/sid/Documents/UR5_VR_teleop/src/robotiq/robotiq_c_model_control/msg/CModel_robot_input.msg"
    "/home/sid/Documents/UR5_VR_teleop/src/robotiq/robotiq_c_model_control/msg/CModel_robot_output.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  include("/home/sid/Documents/UR5_VR_teleop/build/robotiq/robotiq_c_model_control/catkin_generated/safe_execute_install.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/robotiq_c_model_control/cmake" TYPE FILE FILES "/home/sid/Documents/UR5_VR_teleop/build/robotiq/robotiq_c_model_control/catkin_generated/installspace/robotiq_c_model_control-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/sid/Documents/UR5_VR_teleop/devel/include/robotiq_c_model_control")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/sid/Documents/UR5_VR_teleop/devel/share/roseus/ros/robotiq_c_model_control")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/sid/Documents/UR5_VR_teleop/devel/share/common-lisp/ros/robotiq_c_model_control")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/sid/Documents/UR5_VR_teleop/devel/share/gennodejs/ros/robotiq_c_model_control")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/home/sid/Documents/UR5_VR_teleop/devel/lib/python3/dist-packages/robotiq_c_model_control")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/home/sid/Documents/UR5_VR_teleop/devel/lib/python3/dist-packages/robotiq_c_model_control" REGEX "/\\_\\_init\\_\\_\\.py$" EXCLUDE REGEX "/\\_\\_init\\_\\_\\.pyc$" EXCLUDE)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/home/sid/Documents/UR5_VR_teleop/devel/lib/python3/dist-packages/robotiq_c_model_control" FILES_MATCHING REGEX "/home/sid/Documents/UR5_VR_teleop/devel/lib/python3/dist-packages/robotiq_c_model_control/.+/__init__.pyc?$")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/sid/Documents/UR5_VR_teleop/build/robotiq/robotiq_c_model_control/catkin_generated/installspace/robotiq_c_model_control.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/robotiq_c_model_control/cmake" TYPE FILE FILES "/home/sid/Documents/UR5_VR_teleop/build/robotiq/robotiq_c_model_control/catkin_generated/installspace/robotiq_c_model_control-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/robotiq_c_model_control/cmake" TYPE FILE FILES
    "/home/sid/Documents/UR5_VR_teleop/build/robotiq/robotiq_c_model_control/catkin_generated/installspace/robotiq_c_model_controlConfig.cmake"
    "/home/sid/Documents/UR5_VR_teleop/build/robotiq/robotiq_c_model_control/catkin_generated/installspace/robotiq_c_model_controlConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/robotiq_c_model_control" TYPE FILE FILES "/home/sid/Documents/UR5_VR_teleop/src/robotiq/robotiq_c_model_control/package.xml")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/robotiq_c_model_control" TYPE PROGRAM FILES
    "/home/sid/Documents/UR5_VR_teleop/src/robotiq/robotiq_c_model_control/nodes/CModelSimpleController.py"
    "/home/sid/Documents/UR5_VR_teleop/src/robotiq/robotiq_c_model_control/nodes/CModelStatusListener.py"
    "/home/sid/Documents/UR5_VR_teleop/src/robotiq/robotiq_c_model_control/nodes/CModelTcpNode.py"
    "/home/sid/Documents/UR5_VR_teleop/src/robotiq/robotiq_c_model_control/nodes/CModelRtuNode.py"
    )
endif()

