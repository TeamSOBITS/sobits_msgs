cmake_minimum_required(VERSION 3.0.2)
project(sobits_msgs)

## Find catkin macros and libraries
## if COMPONENTS list like find_package(catkin REQUIRED COMPONENTS xyz)
## is used, also find other catkin packages
find_package(catkin REQUIRED COMPONENTS
  std_msgs
  message_generation
  geometry_msgs
)

# Generate messages in the 'msg' folder
add_message_files(
  FILES
  current_state.msg
  current_state_array.msg
  ObjectPose.msg
  ObjectPoseArray.msg
  BoundingBox.msg
  BoundingBoxes.msg
  ObjectPoseArray.msg
  StringArray.msg
)

# Generate services in the 'srv' folder
add_service_files(
  FILES
  grasping_jedgment.srv
  gripper_ctrl.srv
  gripper_move.srv
  odom_base.srv
  robot_motion.srv
  wheel_ctrl.srv
  wheel_control.srv
  put_ctrl.srv
  RunCtrl.srv
)

# Generate added messages and services with any dependencies listed here
generate_messages(
  DEPENDENCIES
  std_msgs
  geometry_msgs
)

###################################
## catkin specific configuration ##
###################################
## The catkin_package macro generates cmake config files for your package
## Declare things to be passed to dependent projects
## INCLUDE_DIRS: uncomment this if your package contains header files
## LIBRARIES: libraries you create in this project that dependent projects also need
## CATKIN_DEPENDS: catkin_packages dependent projects also need
## DEPENDS: system dependencies of this project that dependent projects also need
catkin_package(
  CATKIN_DEPENDS std_msgs message_runtime geometry_msgs
)
