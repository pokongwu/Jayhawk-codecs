#!/bin/bash

# This script starts the gstreamer command for VP8.

gst-launch-1.0 v4l2src device=/dev/video0 \
    ! video/x-raw,width=640,height=480 \
    ! videoscale \
    ! videoconvert \
    ! vp8enc deadline=1 \
    ! rtpvp8pay \
    ! udpsink host=$IP port=8005
