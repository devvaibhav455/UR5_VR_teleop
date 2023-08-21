#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/sid/Documents/UR5_VR_teleop/src/robotiq/robotiq_modbus_tcp"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/sid/Documents/UR5_VR_teleop/install/lib/python3/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/sid/Documents/UR5_VR_teleop/install/lib/python3/dist-packages:/home/sid/Documents/UR5_VR_teleop/build/lib/python3/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/sid/Documents/UR5_VR_teleop/build" \
    "/usr/bin/python3" \
    "/home/sid/Documents/UR5_VR_teleop/src/robotiq/robotiq_modbus_tcp/setup.py" \
     \
    build --build-base "/home/sid/Documents/UR5_VR_teleop/build/robotiq/robotiq_modbus_tcp" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/sid/Documents/UR5_VR_teleop/install" --install-scripts="/home/sid/Documents/UR5_VR_teleop/install/bin"
