FROM ros:humble


# Remove
RUN git clone https://github.com/nachovizzo/spatio_temporal_voxel_layer.git

# Nav2
RUN apt-get update && apt-get install --no-install-recommends -y \
    ros-humble-navigation2 \
    ros-humble-nav2-bringup \
    && rm -rf /var/lib/apt/lists/*


# remove
RUN rm -rf /spatio_temporal_voxel_layer
