#!/bin/bash

# This script starts the gstreamer command for H.264.

gst-launch-1.0 v4l2src device=/dev/video0 \
    ! video/x-raw,width=640,height=480,codec=h264,type=video \
    ! videoscale \
    ! videoconvert \
    ! x264enc tune=zerolatency \
    ! rtph264pay \
    ! udpsink host=$IP port=8004
