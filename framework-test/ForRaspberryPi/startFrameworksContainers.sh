#!/bin/bash

# Script for starting automatically all the docker containers
set -x
#checking for IP address input
if [[ -z "$1" ]]; then
	echo "No ip address provided. Usage: ./runCadvisor.sh <ip-address>"
	exit 1
fi
IP="$1"
#starting the frameworks
echo "Starting cvlc..."
docker run \
        -dt  \
        --privileged \
	      --net=host \
	      -v /dev/video0:/dev/video0 \
	      --name=cvlc \
	      -e IP="${IP}" \
	      cvlc


echo "Starting ffmpeg..."
docker run \
        -dt  \
        --privileged \
	      --net=host \
	      -v /dev/video0:/dev/video0 \
	      --name=ffmpeg \
	      -e IP="${IP}" \
	      ffmpeg


	      echo "Starting gstreamer..."
docker run \
        -dt \
        --privileged \
	      --net=host \
	      -v /dev/video0:/dev/video0 \
	      --name=gstreamer \
	      -e IP="${IP}" \
	      gstreamer

	      echo "Starting mjpgstreamer..."
docker run \
        --rm  \
        --privileged \
	      --net=host \
	      -v /dev/video0:/dev/video0 \
	      --name=mjpgstreamer \
	      -e IP="${IP}" \
	      -d \
	      mjpgstreamer