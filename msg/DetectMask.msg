# Information about the class and score
vision_msgs/ObjectHypothesisWithPose[] results

string instance_id        # class is matched with id

# Mask representation
int32[] pixel_x           # pixel x coordinates of the mask
int32[] pixel_y           # pixel y coordinates of the mask
sensor_msgs/Image mask    # Optional: for debug/visualization
