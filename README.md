## ROS2 Docker Attempt on MacOS with M1 Chip

Following <a href="https://www.youtube.com/watch?v=XcJzOYe3E6M&list=PLunhqkrRNRhaqt0UfFxxC_oj7jscss2qe">YouTube</a>, but failed the rviz2 GUI. Could X11 on MacOS M1 problem, but likely a ros_jazzy on Ubuntu 24.04.1 LTS problem. Dumping the following:

    docker image pull ros:jazzy 
    docker image ls
    docker image rm
    docker run --name ROS_macOS -it ros:jazzy
    docker container ls -a
    docker container stop $NAME, or ctrl-d
    docker container start -i $NAME
    docker container exec -it $NAME /bin/bash
    docker container rm $NAME, or docker container prune

    cd ~/ROS_macOS_docker/
    docker image build --platform linux/amd64 -t ros_jazzy_image .
    docker run --platform linux/amd64 --name ROS_macOS --user ros --network host --ipc host -e DISPLAY -e TERM -e QT_X11_NO_MITSHM=1 -v /tmp/.X11-unix:/tmp/.X11-unix:rw -v .:/home/ros/Documents/ -it ros_jazzy_image

    docker run --rm --platform linux/amd64 --name ROS_macOS --user ros --network host --ipc host --env="DISPLAY=host.docker.internal:0" -e TERM -e QT_X11_NO_MITSHM=1 -v /tmp/.X11-unix:/tmp/.X11-unix:rw -it ros_jazzy_image ros2 run turtlesim turtlesim_node 

    xhost +local:root
