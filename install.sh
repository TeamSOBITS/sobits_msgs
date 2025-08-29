#!/bin/bash

echo "╔══╣ Setup: SOBIT INTERFACES (STARTING) ╠══╗"

# Download ROS packages
sudo apt update
sudo apt install -y \
    ros-$ROS_DISTRO-vision-msgs

echo "╚══╣ Setup: SOBITS INTERFACES (FINISHED) ╠══╝"
