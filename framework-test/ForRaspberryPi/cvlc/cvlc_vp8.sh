#!/bin/bash

# This script starts the cvlc command for VP8.

cvlc -vvv v4l2:///dev/video0 \
    --sout "#transcode{vcodec=VP80,vb=2000,width=640,fps=6,deadline=1,speed=16,quality=realtime}:rtp{dst=$IP,port=8005}" \
    --no-sout-audio
