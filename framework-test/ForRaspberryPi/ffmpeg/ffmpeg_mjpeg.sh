#!/bin/bash

# This script starts the ffmpeg command for mjpeg.

ffmpeg -fflags nobuffer \
    -f v4l2 \
    -framerate 30 \
    -i /dev/video0 \
    -vcodec mjpeg \
    -f mjpeg udp://$IP:2000
