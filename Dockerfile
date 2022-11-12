FROM ros:melodic-ros-base-bionic 
ARG DEBIAN_FRONTEND=noninteractive

RUN \
	apt update -y && \
	apt upgrade -y

RUN apt install -y \
	build-essential \
	cmake \
	libyaml-cpp-dev \
	libpcap-dev \
	libeigen3-dev \
	libjsoncpp-dev

RUN apt install -y \
	ros-melodic-pcl-ros \
	ros-melodic-rviz \
	ros-melodic-tf2-geometry-msgs \
	ros-melodic-cv-bridge \
	ros-melodic-angles

RUN mkdir -p /catkin_ws/src

WORKDIR /catkin_ws/src
RUN /bin/bash -c '. /opt/ros/melodic/setup.bash; catkin_init_workspace'
RUN git clone https://github.com/ouster-lidar/ouster-ros.git --recursive

WORKDIR /catkin_ws
RUN /bin/bash -c '. /opt/ros/melodic/setup.bash; catkin_make'
RUN echo "source /catkin_ws/devel/setup.bash" >> ~/.bashrc

RUN mkdir -p /workspace
WORKDIR /workspace

RUN echo "./run_ouster.sh" >> ~/.bashrc
