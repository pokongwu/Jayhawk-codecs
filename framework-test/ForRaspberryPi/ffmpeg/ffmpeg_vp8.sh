#!/bin/bash

# This script starts the ffmpeg command for VP8.

ffmpeg -fflags nobuffer \
    -f v4l2 \
    -framerate 30 \
    -i /dev/video0 \
    -vcodec libvpx \
    -deadline realtime \
    -crf 23 \
    -speed 16 \
    -quality realtime \
    -f rtp rtp://$IP:8005
