cmake_minimum_required(VERSION 3.8)
project(sobits_msgs)

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()

# find dependencies
find_package(ament_cmake REQUIRED)
find_package(std_msgs REQUIRED)
find_package(geometry_msgs REQUIRED)
find_package(rosidl_default_generators REQUIRED)

set(msg_files
  "msg/BoundingBox.msg"
  "msg/BoundingBoxes.msg"
  "msg/CurrentState.msg"
  "msg/CurrentStateArray.msg"
  "msg/MotorState.msg"
  "msg/MotorStateArray.msg"
  "msg/ObjectPose.msg"
  "msg/ObjectPoseArray.msg"
  "msg/StringArray.msg"
)
set(srv_files
  "srv/GraspingJudgment.srv"
  "srv/GripperCtrl.srv"
  "srv/GripperMove.srv"
  "srv/OdomBase.srv"
  "srv/PutCtrl.srv"
  "srv/RobotMotion.srv"
  "srv/RunCtrl.srv"
  "srv/SpeechRecognition.srv"
  "srv/TextToSpeech.srv"
  "srv/WheelControl.srv"
  "srv/WheelCtrl.srv"
)
rosidl_generate_interfaces(${PROJECT_NAME}
  ${msg_files}
  ${srv_files}
  DEPENDENCIES std_msgs geometry_msgs
)

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
