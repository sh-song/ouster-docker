export ROS_IP=192.168.0.2
export ROS_MASTER_URI=http://192.168.0.2:11311

roslaunch ouster_ros sensor.launch sensor_hostname:=192.168.0.3 viz:=false

