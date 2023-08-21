# Install script for directory: /home/sid/Documents/UR5_VR_teleop/src/htc_vive_teleop_stuff

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/sid/Documents/UR5_VR_teleop/build/htc_vive_teleop_stuff/catkin_generated/installspace/htc_vive_teleop_stuff.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/htc_vive_teleop_stuff/cmake" TYPE FILE FILES
    "/home/sid/Documents/UR5_VR_teleop/build/htc_vive_teleop_stuff/catkin_generated/installspace/htc_vive_teleop_stuffConfig.cmake"
    "/home/sid/Documents/UR5_VR_teleop/build/htc_vive_teleop_stuff/catkin_generated/installspace/htc_vive_teleop_stuffConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/htc_vive_teleop_stuff" TYPE FILE FILES "/home/sid/Documents/UR5_VR_teleop/src/htc_vive_teleop_stuff/package.xml")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/htc_vive_teleop_stuff" TYPE PROGRAM FILES
    "/home/sid/Documents/UR5_VR_teleop/src/htc_vive_teleop_stuff/scripts/vive_tf_and_joy.py"
    "/home/sid/Documents/UR5_VR_teleop/src/htc_vive_teleop_stuff/scripts/frame_as_posestamped.py"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/htc_vive_teleop_stuff/launch" TYPE DIRECTORY FILES "/home/sid/Documents/UR5_VR_teleop/src/htc_vive_teleop_stuff/launch/")
endif()

