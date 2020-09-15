#!/bin/bash

# Script for starting automatically all the docker containers 
# and the cadvisor
set -x
#stop/remove containers
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)

#staring cadvisor
echo "Starting cadvisor"
docker run \
		--volume=/:/rootfs:ro \
		--volume=/var/run:/var/run:rw \
		--volume=/sys:/sys:ro \
		--volume=/var/lib/docker/:/var/lib/docker:ro \
		--volume=/dev/disk/:/dev/disk:ro \
		--publish=8080:8080 \
		--detach=true \
		--name=cadvisor unibaktr/cadvisor

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