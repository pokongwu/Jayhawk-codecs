#!/bin/bash

# This script starts the gstreamer command for mjpeg.

gst-launch-1.0 v4l2src device=/dev/video0 \
    ! video/x-raw,width=640,height=480,type=video \
    ! videoscale \
    ! videoconvert \
    ! jpegenc \
    ! rtpjpegpay pt=96 \
    ! udpsink host=$IP port=2000
