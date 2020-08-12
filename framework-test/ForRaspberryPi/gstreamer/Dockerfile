FROM    arm64v8/debian:buster-backports

RUN     apt-get update && apt-get install -y \
            libgstreamer1.0-0 \
	    gstreamer1.0-plugins-base \
	    gstreamer1.0-plugins-good \
	    gstreamer1.0-plugins-bad \
	    gstreamer1.0-plugins-ugly \
	    gstreamer1.0-libav \
	    gstreamer1.0-tools \
	    gstreamer1.0-alsa \
	    gstreamer1.0-pulseaudio \
            v4l-utils

COPY . .

ENTRYPOINT  ["/bin/bash"]

