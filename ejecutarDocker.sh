sudo docker run -t \
                        -e DISPLAY=:0 --privileged=true \
                        -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
                        -v docker:/home/yocto \
                        -v /dev/bus/usb/:/dev/bus/usb/ \
                        --rm -i yocto /bin/bash; \
