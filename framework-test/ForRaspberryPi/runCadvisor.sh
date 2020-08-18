#!/bin/bash

#starting cadivsor

docker run  \
        --rm \
        --volume=/:/rootfs:ro \
        --volume=/var/run:/var/run:ro \
        --volume=/sys:/sys:ro \
        --volume=/var/lib/docker/:/var/lib/docker:ro \
        --volume=/dev/disk/:/dev/disk:ro \
        --publish=8080:8080 \
        --name=cadvisor \
        --detach=true \
        google/cadivsor:latest