#!/bin/bash

echo "Starting janus ..."
service nginx start
cd /opt/janus/bin/
./janus -F /opt/janus/etc/janus/
