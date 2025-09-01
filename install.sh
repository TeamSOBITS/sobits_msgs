#!/bin/bash

echo "╔══╣ Setup: sobits interfaces (STARTING) ╠══╗"

# Download ROS packages
sudo apt-get update
sudo apt-get install -y \
    ros-$ROS_DISTRO-vision-msgs

echo "╚══╣ Setup: sobits interfaces (FINISHED) ╠══╝"
