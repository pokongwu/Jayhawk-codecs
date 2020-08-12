#!/bin/bash

# This script starts the cvlc command for H.264.

cvlc -vvv v4l2:///dev/video0 \
    --sout "#transcode{vcodec=h264,width=640,fps=24,tune=zerolatency,preset=ultrafast}:udp{dst=$IP:2000}" \
    --no-sout-audio
