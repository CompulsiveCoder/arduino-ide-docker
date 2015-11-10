xhost +

docker run -ti --rm \
       -e DISPLAY=$DISPLAY \
       -v /tmp/.X11-unix:/tmp/.X11-unix \
       --device=/dev/ttyUSB0
       --device=/dev/ttyACM0
       -v /home/j/cloud /home/j/cloud
       arduino
