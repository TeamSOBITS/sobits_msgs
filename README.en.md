<a name="readme-top"></a>

[JA](README.md) | [EN](README.en.md)

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![License][license-shield]][license-url]

# SOBITS msgs

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#introduction">Introduction</a>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li>
    　<a href="#launch-and-usage">Launch and Usage</a>
      <ul>
        <li><a href="#customized-ros-msgs">Customized ROS msgs</a></li>
        <li><a href="#customized-ros-services">Customized ROS services</a></li>
      </ul>
    </li>
    <li><a href="#milestone">Milestone</a></li>
    <!-- <li><a href="#contributing">Contributing</a></li> -->
    <!-- <li><a href="#license">License</a></li> -->
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>



<!-- INTRODUCTION -->
## Introduction

SOBITS msgs is a repository designed to facilitate the definition of messages and servicesm with the purpose to manage the data required to run SOBITS-built robots.

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- GETTING STARTED -->
## Getting Started

Here you will find out instructions on setting up this project locally.

<p align="right">(<a href="#readme-top">back to top</a>)</p>


### Prerequisites

First, please set up the following environment before proceeding to the next installation stage.

| System  | Version |
| ------------- | ------------- |
| Ubuntu | 20.04 (Focal Fossa) |
| ROS | Noetic Ninjemys |

> [!NOTE]
> If you need to install `Ubuntu` or `ROS`, please check our [SOBITS Manual](https://github.com/TeamSOBITS/sobits_manual#%E9%96%8B%E7%99%BA%E7%92%B0%E5%A2%83%E3%81%AB%E3%81%A4%E3%81%84%E3%81%A6).

<p align="right">(<a href="#readme-top">back to top</a>)</p>


### Installation

1. Go to the `src` folder of ROS.
   ```sh
   $ roscd
   # Or just use "cd ~/catkin_ws/" and change directory.
   $ cd src/
   ```
2. Clone this repository.
   ```sh
   $ git clone https://github.com/TeamSOBITS/sobits_msgs
   ```
3. Compile the package.
   ```sh
   $ roscd
   # Or just use "cd ~/catkin_ws/" and change directory.
   $ catkin_make
   ```

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- LAUNCH AND USAGE EXAMPLES -->
## Launch and Usage

> [!NOTE]
> This repository is a collection of ROS messages and services, so there are no executable programs available.

<p align="right">(<a href="#readme-top">back to top</a>)</p>


### Customized ROS msgs

ROS messages customized by SOBITS are shown below.

1.  `BoundingBox.msg` : This msg summaries the 2D information obtained from YOLO and other sources.
    ```yaml
    string  Class
    float64 probability
    int32   xmin
    int32   ymin
    int32   xmax
    int32   ymax
    ```

> [!WARNING]
> `BoundingBox.msg` will be deprecated in a future.

2.  `BoundingBoxes.msg` : Array of multiple `BoundingBox.msg`.
    ```yaml
    Header header
    BoundingBox[] bounding_boxes
    ```

> [!WARNING]
> `BoundingBoxes.msg` will be deprecated in a future.s

3.  `current_state.msg` : This msg summaries the current values for each joint of the robot.
    ```yaml
    string joint_name
    float64 current_ma
    ```

4.  `current_state_array.msg` : Array of multiple `current_state.msg`.
    ```yaml
    current_state[] current_state_array
    ```

5.  `MotorState.msg` : This msg summaries the information on the actuators of each robot.
    ```yaml
    time  stamp       # motor state is at this time
    int32 id          # motor id
    int32 goal        # commanded position (in encoder units)
    int32 position    # current position (in encoder units)
    int32 speed       # current speed (0.111 rpm per unit)
    int32 load        # current load - ratio of applied torque over maximum torque
    int32 voltage     # current voltage (V)
    int32 temperature # current temperature (degrees Celsius)
    bool  moving      # whether the motor is currently in motion
    ```

6.  `MotorStateArray.msg` : Array of multiple `MotorState.msg`.
    ```yaml
    MotorState[] motor_states
    ```

7.  `ObjectPose.msg` : This msg summaries the 3D information on objects obtained from YOLO and other sources.
    ```yaml
    string Class
    geometry_msgs/Pose pose
    int32 detect_id
    ```

> [!WARNING]
> `ObjectPose.msg` will be deprecated in a future.

8.  `ObjectPoseArray.msg` : Array of multiple `ObjectPose.msg`.
    ```yaml
    Header header
    ObjectPose[] object_poses
    ```

> [!WARNING]
> `ObjectPoseArray.msg` will be deprecated in a future.

9.  `StringArray.msg` : This msg summaries multiple character type information into an array.
    ```yaml
    Header header
    string[] data
    ```

<p align="right">(<a href="#readme-top">back to top</a>)</p>


### Customized ROS services

ROS services customized by SOBITS are shown below.

1.  `grasping_jedgment.srv` : This srv returns the grasp judgment.
    ```yaml
    ---
    bool is_grasped
    ```

2.  `gripper_ctrl.srv` : This srv allows to open and close the robot hand.
    ```yaml
    float64 rad
    float64 sec
    ---
    bool is_moved
    ```

3.  `gripper_move.srv` : This srv moves the robot hand to the specified position.
    ```yaml
    string target_name
    geometry_msgs/Point shift
    ---
    bool is_moved
    ```

4.  `odom_base.srv` : This srv provides the requested ODOM information.
    ```yaml
    string req_str
    ---
    string res_str
    ```

5.  `put_ctrl.srv` : This srv allows placement operations with the robot hand.
    ```yaml
    ---
    bool result
    ```

6.  `robot_motion.srv` : This srv allows the robot to move to the specified pose.
    ```yaml
    string motion_type
    ---
    bool is_moved
    ```

7.  `RunCtrl.srv` : This srv specifies start/stop command.
    ```yaml
    bool request
    ---
    bool response
    ```

8.  `SpeechRecognition.srv` : This srv is for voice recognition.．
    ```yaml
    int64 timeout_sec
    ---
    string[] transcript
        ```

9.  `TextToSpeech.srv` : This srv specify the content of the utterance．
    ```yaml
    string text
    ---
    bool result
    ```


10.  `wheel_control.srv` : This srv allows to move the robot according to the specified angle and/or distance.
    ```yaml
    float64 straight_line
    float64 turn_angle
    ---
    string responce
    ```

11.  `wheel_ctrl.srv` : This srv checks if the movement has been done correctly according to the specified method.
    ```yaml
    string move_order
    ---
    string is_moved
    ```

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- MILESTONE -->
## Milestone

- [x] OSS
    - [x] Improved Documentation
    - [x] Update of customized msgs

See the [open issues][license-url] for a full list of proposed features (and known issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- CONTRIBUTING -->
<!-- ## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#readme-top">back to top</a>)</p> -->



<!-- LICENSE -->
<!-- ## License

Distributed under the MIT License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p> -->


<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

* [msg - ROS Wiki](http://wiki.ros.org/msg)
* [Services - ROS Wiki](http://wiki.ros.org/Services)
* [ROS/Tutorials/CreatingMsgAndSrv](http://wiki.ros.org/ROS/Tutorials/CreatingMsgAndSrv)
* [ROS Noetic](http://wiki.ros.org/noetic)

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/TeamSOBITS/sobits_msgs.svg?style=for-the-badge
[contributors-url]: https://github.com/TeamSOBITS/sobits_msgs/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/TeamSOBITS/sobits_msgs.svg?style=for-the-badge
[forks-url]: https://github.com/TeamSOBITS/sobits_msgs/network/members
[stars-shield]: https://img.shields.io/github/stars/TeamSOBITS/sobits_msgs.svg?style=for-the-badge
[stars-url]: https://github.com/TeamSOBITS/sobits_msgs/stargazers
[issues-shield]: https://img.shields.io/github/issues/TeamSOBITS/sobits_msgs.svg?style=for-the-badge
[issues-url]: https://github.com/TeamSOBITS/sobits_msgs/issues
[license-shield]: https://img.shields.io/github/license/TeamSOBITS/sobits_msgs.svg?style=for-the-badge
[license-url]: LICENSE
