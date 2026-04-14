#!/bin/bash

echo "╔══╣ Setup: SOBITS INTERFACES (STARTING) ╠══╗"

# Download ROS packages
sudo apt update
sudo apt install -y \
    ros-$ROS_DISTRO-vision-msgs \
    ros-$ROS_DISTRO-moveit-msgs

echo "╚══╣ Setup: SOBITS INTERFACES (FINISHED) ╠══╝"
