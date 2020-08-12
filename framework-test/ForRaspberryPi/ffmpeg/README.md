# ffmpeg
## Running command on pi
docker run -it --privileged --net=host -v /dev/video0:/dev/video0 -e IP="<IP_of_Receiver>" ffmpeg

### Commands for testing:
**H.264:**
ffmpeg -fflags nobuffer -f v4l2 -framerate 30 -i /dev/video0 -vcodec libx264 -preset ultrafast -tune zerolatency -pix_fmt yuv420p -f mpegts udp://$IP:2000?pkt_size=1316
**VP8:**
ffmpeg -fflags nobuffer -f v4l2 -framerate 30 -i /dev/video0 -vcodec libvpx -deadline realtime -crf 23 -speed 16 -quality realtime -f rtp rtp://$IP:8005
Only coding into file:
ffmpeg -fflags nobuffer -f v4l2 -framerate 30 -i /dev/video0 -vcodec libvpx output.webm
**MJPEG:**
ffmpeg -fflags nobuffer -f v4l2 -framerate 30 -i /dev/video0 -vcodec mjpeg -f mjpeg udp://$IP:2000
