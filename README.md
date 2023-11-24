<a name="readme-top"></a>

[JA](README.md) | [EN](README.en.md)

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![License][license-shield]][license-url]

# SOBITS MSGS

<!-- 目次 -->
<details>
  <summary>目次</summary>
  <ol>
    <li>
      <a href="#概要">概要</a>
    </li>
    <li>
      <a href="#環境構築">環境構築</a>
      <ul>
        <li><a href="#環境条件">環境条件</a></li>
        <li><a href="#インストール方法">インストール方法</a></li>
      </ul>
    </li>
    <li>
    　<a href="#実行・操作方法">実行・操作方法</a>
      <ul>
        <li><a href="#ROSメッセージの種類">ROSメッセージの種類</a></li>
        <li><a href="#ROSサービスの種類">ROSサービスの種類</a></li>
      </ul>
    </li>
    <li><a href="#マイルストーン">マイルストーン</a></li>
    <!-- <li><a href="#contributing">Contributing</a></li> -->
    <!-- <li><a href="#license">License</a></li> -->
    <li><a href="#参考文献">参考文献</a></li>
  </ol>
</details>



<!-- レポジトリの概要 -->
## 概要

SOBITS msgsはSOBITSが独自で作成したROSメッセージをまとめたレポジトリです．SOBITS自作ロボットを動かすために，必要なメッセージを定義し，データの管理をしやすくするを目的として作られたものです．

<p align="right">(<a href="#readme-top">上に戻る</a>)</p>



<!-- セットアップ -->
## セットアップ

ここで，本レポジトリのセットアップ方法について説明します．

### 環境条件

まず，以下の環境を整えてから，次のインストール段階に進んでください．

| System  | Version |
| ------------- | ------------- |
| Ubuntu | 20.04 (Focal Fossa) |
| ROS | Noetic Ninjemys |

> [!NOTE]
> `Ubuntu`や`ROS`のインストール方法に関しては，[SOBIT Manual](https://github.com/TeamSOBITS/sobits_manual#%E9%96%8B%E7%99%BA%E7%92%B0%E5%A2%83%E3%81%AB%E3%81%A4%E3%81%84%E3%81%A6)に参照してください．

### インストール方法

1. ROSの`src`フォルダに移動します．
   ```sh
   $ roscd
   # もしくは，"cd ~/catkin_ws/"へ移動．
   $ cd src/
   ```
2. 本レポジトリをcloneします．
   ```sh
   $ git clone https://github.com/TeamSOBITS/sobits_msgs
   ```
3. パッケージをコンパイルします．
   ```sh
   $ roscd
   # もしくは，"cd ~/catkin_ws/"へ移動．
   $ catkin_make
   ```

<p align="right">(<a href="#readme-top">上に戻る</a>)</p>



<!-- 実行・操作方法 -->
## 実行・操作方法

> [!NOTE]
> 本レポジトリは独自のROSメッセージをまとめたもののため，実行可能なプログラムはありません．

<p align="right">(<a href="#readme-top">上に戻る</a>)</p>


### ROSメッセージの種類

SOBITSとして用意されているROSメッセージはこちらとなります．

1.  `BoundingBox.msg` : YOLOなどで得られた2次元情報をまとめたmsgです．
    ```go
    string  Class
    float64 probability
    int32   xmin
    int32   ymin
    int32   xmax
    int32   ymax
    ```

> [!WARNING]
> `BoundingBox.msg`は今後廃止状態（deprecated）になる予定です．

1.  `BoundingBoxes.msg` : 複数のBoundingBox.msgを配列にしたmsgです．
    ```go
    Header header
    BoundingBox[] bounding_boxes
    ```

> [!WARNING]
> `BoundingBoxes.msg`は今後廃止状態（deprecated）になる予定です．

1.  `current_state.msg` : ロボットのそれぞれの関節の電流値をまとめたmsgです．
    ```go
    string joint_name
    float64 current_ma
    ```

1.  `current_state_array.msg` : 複数のcurrent_state.msgを配列にしたmsgです．
    ```go
    current_state[] current_state_array
    ```

1.  `MotorState.msg` : ロボットそれぞれのアクチュエータの情報をまとめたmsgです．
    ```go
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

1.  `MotorStateArray.msg` : 複数のMotorState.msgを配列にしたmsgです．
    ```go
    MotorState[] motor_states
    ```

1.  `ObjectPose.msg` : YOLOなどで得られた物体の3次元情報をまとめたmsgです．
    ```go
    string Class
    geometry_msgs/Pose pose
    int32 detect_id
    ```

> [!WARNING]
> `ObjectPose.msg`は今後廃止状態（deprecated）になる予定です．

1.  `ObjectPoseArray.msg` : 複数のObjectPose.msgを配列にしたmsgです．
    ```go
    Header header
    ObjectPose[] object_poses
    ```

> [!WARNING]
> `ObjectPoseArray.msg`は今後廃止状態（deprecated）になる予定です．

1.  `StringArray.msg` : 複数の文字型情報を配列にしたmsgです．
    ```go
    Header header
    string[] data
    ```

<p align="right">(<a href="#readme-top">上に戻る</a>)</p>



### ROSメッセージの種類

SOBITSとして用意されているROSサービスはこちらとなります．

1.  `grasping_jedgment.srv` : 把持判定を確認するためのsrvです．
    ```go
    ---
    bool is_grasped
    ```

1.  `gripper_ctrl.srv` : ロボットのハンドを開閉するためのsrvです．
    ```go
    float64 rad
    float64 sec
    ---
    bool is_moved
    ```

1.  `gripper_move.srv` : ロボットのハンドを指定された位置へ移動されるためのsrvです．
    ```go
    string target_name
    geometry_msgs/Point shift
    ---
    bool is_moved
    ```

1.  `odom_base.srv` : 頼まれた情報を提供するためのsrvです．
    ```go
    string req_str
    ---
    string res_str
    ```

1.  `put_ctrl.srv` : ロボットのハンドによる配置操作を行うためのsrvです．
    ```go
    ---
    bool result
    ```

1.  `robot_motion.srv` : 指定されたポースに移動させるためのsrvです．
    ```go
    string motion_type
    ---
    bool is_moved
    ```

1.  `RunCtrl.srv` : 起動・停止を指定するためのsrvです．
    ```go
    bool request
    ---
    bool response
    ```

1.  `wheel_control.srv` : 指定された角度や距離に応じてロボットを移動させるためのsrvです．
    ```go
    float64 straight_line
    float64 turn_angle
    ---
    string responce
    ```

1.  `wheel_ctrl.srv` : 指定された移動方法に応じて正しく移動できたかどうかを確認するためのsrvです．
    ```go
    string move_order
    ---
    string is_moved
    ```

<p align="right">(<a href="#readme-top">上に戻る</a>)</p>



<!-- マイルストーン -->
## マイルストーン

- [x] パラメタによるSOBIT PROと移動機構のみの切り替え
- [ ] exampleファイルの修正
- [ ] OSS
    - [ ] ドキュメンテーションの充実
    - [ ] コーディングスタイルの統一

現時点のバッグや新規機能の依頼を確認するために[Issueページ][license-url] をご覧ください．

<p align="right">(<a href="#readme-top">上に戻る</a>)</p>



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

<p align="right">(<a href="#readme-top">上に戻る</a>)</p> -->



<!-- LICENSE -->
<!-- ## License

Distributed under the MIT License. See `LICENSE.txt` for more NOTErmation.

<p align="right">(<a href="#readme-top">上に戻る</a>)</p> -->



<!-- 参考文献 -->
## 参考文献

* [msg - ROS Wiki](http://wiki.ros.org/msg)
* [Services - ROS Wiki](http://wiki.ros.org/Services)
* [ROS/Tutorials/CreatingMsgAndSrv](http://wiki.ros.org/ROS/Tutorials/CreatingMsgAndSrv)
* [ROS Noetic](http://wiki.ros.org/noetic)

<p align="right">(<a href="#readme-top">上に戻る</a>)</p>


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
[license-url]: https://github.com/TeamSOBITS/sobits_msgs/blob/master/LICENSE