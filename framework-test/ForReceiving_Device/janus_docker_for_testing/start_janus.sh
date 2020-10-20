#!/bin/bash

# Script for starting janus docker container

docker stop janus
docker rm janus
docker run --name=janus --net=host janus
