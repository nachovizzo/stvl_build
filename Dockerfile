ARG ROS_DISTRO
FROM ros:${ROS_DISTRO}
LABEL maintainer="Ignacio Vizzo <ignaciovizzo@gmail.com>"
ENV USER_NAME="user"
ENV GROUP_ID=1000
ENV USER_ID=1000

# Add normal sudo-user to container, passwordless
RUN addgroup --gid $GROUP_ID $USER_NAME \
    && adduser --disabled-password --gecos '' --uid $USER_ID --gid $GROUP_ID $USER_NAME \
    && adduser $USER_NAME sudo \
    && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers \
    && sed -i 's/required/sufficient/' /etc/pam.d/chsh \
    && touch /home/$USER_NAME/.sudo_as_admin_successful

# CCache
RUN apt-get update && apt-get install --no-install-recommends -y \
    ccache \
    && rm -rf /var/lib/apt/lists/*

# Nav2 and PCL Conversions
RUN apt-get update && apt-get install --no-install-recommends -y \
    ros-${ROS_DISTRO}-navigation2 \
    ros-${ROS_DISTRO}-nav2-bringup \
    ros-${ROS_DISTRO}-pcl-conversions \
    && rm -rf /var/lib/apt/lists/*

# Setup workdir and entrypoint
RUN echo "export HISTFILE=/home/$USER_NAME/ros_ws/.bash_history" >> /home/$USER_NAME/.bashrc
WORKDIR /home/$USER_NAME/ros_ws
