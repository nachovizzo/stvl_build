FROM ros:humble
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

# Nav2
RUN apt-get update && apt-get install --no-install-recommends -y \
    ros-humble-navigation2 \
    ros-humble-nav2-bringup 
    # && rm -rf /var/lib/apt/lists/*

# Setup workdir and entrypoint
WORKDIR /home/$USER_NAME/ros_ws
CMD ["bash", "--login"]
