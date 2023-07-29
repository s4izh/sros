docker run -it \
    --net=host \
    -v $(pwd):/app \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v $HOME/.Xauthority:/root/.Xauthority \
    -e DISPLAY=$DISPLAY \
    -e CARGO_HOME=/app/.cargo \
    -e CARGO_TARGET_DIR=/app/target \
    ros:latest \
    /bin/bash
