# mjpg-streamer
## Running command on pi
docker run --it --privileged --net=host -v /dev/video0:/dev/video0 -e IP='IP_of_reciever' mjpgstreamer
**MJPEG**
/usr/local/bin/mjpg_streamer -i "/usr/local/lib/mjpg-streamer/input_uvc.so -n -f 30 -r 1280x720" -o "/usr/local/lib/mjpg-streamer/output_http.so -p 8085 -w /usr/local/share/mjpg-streamer/www"
