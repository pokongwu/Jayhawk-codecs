#!/bin/bash

# This script starts the ffmpeg command for H.264.

ffmpeg -fflags nobuffer \
    -f v4l2 \
    -framerate 30 \
    -i /dev/video0 \
    -vcodec libx264 \
    -preset ultrafast \
    -tune zerolatency \
    -pix_fmt yuv420p \
    -f mpegts udp://$IP:2000?pkt_size=1300
