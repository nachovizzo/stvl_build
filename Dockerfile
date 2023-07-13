FROM ros:humble
LABEL maintainer="Ignacio Vizzo <ignaciovizzo@gmail.com>"
ENV USER_NAME="user"
ENV GROUP_ID=1000
ENV USER_ID=1000

# Use local mirrors for faster deployment
RUN sed -i -e 's/http:\/\/archive\.ubuntu\.com\/ubuntu\//mirror:\/\/mirrors\.ubuntu\.com\/mirrors\.txt/' /etc/apt/sources.list

# Nav2
RUN apt-get update && apt-get install --no-install-recommends -y \
    ros-humble-navigation2 \
    ros-humble-nav2-bringup \
    && rm -rf /var/lib/apt/lists/*
