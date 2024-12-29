FROM osrf/ros:jazzy-desktop-full

RUN apt-get update\
    && apt-get install -y\
        vim\
    && rm -rf /var/lib/apt/lists/
RUN mkdir /home/ubuntu/Documents/
COPY Robotics_ModellingPlanningAndControl_Sciavicco.pdf /home/ubuntu/Documents/ 

# Create a non-root user
ARG USERNAME=ros
ARG USER_UID=1001
ARG USER_GID=$USER_UID
RUN groupadd --gid $USER_GID $USERNAME \
  && useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME \
  && mkdir /home/$USERNAME/.config && chown $USER_UID:$USER_GID /home/$USERNAME/.config

# Set up sudo, no password 
RUN apt-get update\
  && apt-get install -y\
    sudo\
  && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME\
  && chmod 0440 /etc/sudoers.d/$USERNAME\
  && rm -rf /var/lib/apt/lists/*



