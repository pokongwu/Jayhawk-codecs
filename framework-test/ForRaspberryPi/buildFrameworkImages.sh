#!/bin/sh
cd cvlc/ && docker build -t cvlc .
cd ../ffmpeg && docker build -t ffmpeg .
cd ../gstreamer && docker build -t gstreamer .
cd ../mjpgstreamer && docker build -t mjpgstreamer .

