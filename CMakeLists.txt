cmake_minimum_required(VERSION 3.8)
project(sobits_interfaces)

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()

# find dependencies
find_package(ament_cmake REQUIRED)
find_package(std_msgs REQUIRED)
find_package(geometry_msgs REQUIRED)
find_package(sensor_msgs REQUIRED)
find_package(vision_msgs REQUIRED)
find_package(rosidl_default_generators REQUIRED)

set(msg_files
  msg/BoundingBox.msg
  msg/BoundingBoxes.msg
  msg/CurrentState.msg
  msg/CurrentStateArray.msg
  msg/ObjectPose.msg
  msg/ObjectPoseArray.msg
  msg/StringArray.msg
  msg/KeyPoint.msg
  msg/KeyPointArray.msg
  msg/Feature.msg
)
set(srv_files
  srv/RunCtrl.srv
  srv/ModeCtrl.srv
  srv/MoveHandToTargetCoord.srv
  srv/MoveHandToTargetTF.srv
  srv/Features.srv
  srv/Feature3d.srv
  srv/VlaRecordState.srv
  srv/VlaUpdateTask.srv
  srv/GetFingerAngle.srv
)
set(action_files
  action/ChatLlmRecognition.action
  action/SpeechRecognition.action
  action/TextToSpeech.action
  action/MoveJoint.action
  action/MoveToPose.action
  action/MoveWheelLinear.action
  action/MoveWheelRotate.action
  action/VlaRecordState.action
  action/DisplayControl.action
)

rosidl_generate_interfaces(${PROJECT_NAME}
  ${msg_files}
  ${srv_files}
  ${action_files}
  DEPENDENCIES std_msgs geometry_msgs sensor_msgs vision_msgs
)

install(DIRECTORY mp3 DESTINATION share/${PROJECT_NAME})

# uncomment the following section in order to fill in
# further dependencies manually.
# find_package(<dependency> REQUIRED)

if(BUILD_TESTING)
  find_package(ament_lint_auto REQUIRED)
  # the following line skips the linter which checks for copyrights
  # comment the line when a copyright and license is added to all source files
  set(ament_cmake_copyright_FOUND TRUE)
  # the following line skips cpplint (only works in a git repo)
  # comment the line when this package is in a git repo and when
  # a copyright and license is added to all source files
  set(ament_cmake_cpplint_FOUND TRUE)
  ament_lint_auto_find_test_dependencies()
endif()

ament_package()
