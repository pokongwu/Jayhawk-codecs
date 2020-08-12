#!/bin/bash

# This script starts the cvlc command for mjpeg.

cvlc -vvv v4l2:///dev/video0 \
    --sout "#transcode{vcodec=mjpg,fps=24}:udp{dst=$IP:2000}" \
    --no-sout-audio
