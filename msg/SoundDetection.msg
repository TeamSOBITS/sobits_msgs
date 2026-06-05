std_msgs/Header header
string label        # best class detected (e.g. "Doorbell", "Bell")
float32 score       # Score for that class [0-1]
string top_label    # overall top class regardless of category (for diagnostics)
float32 top_score   # overall top score (for diagnostics)
