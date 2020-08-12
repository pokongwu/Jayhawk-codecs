# cvlc

## Running command on pi
docker run -it --privileged --net=host -v /dev/video0:/dev/video0 -e IP="<IP_of_Receiver>" cvlc

### Commands for testing:
**H.264:**
cvlc l2:///dev/video0 --sout "#transcode{vcodec=h264,fps=24,tune=zerolatency,preset=ultrafast}:udp{dst=$IP:2000}" --no-sout-audio
**VP8:**
cvlc v4l2:///dev/video0 --sout "#transcode{vcodec=VP80,vb=2000,width=640,fps=6,deadline=1,speed=16,quality=realtime}:rtp{dst=$IP,port=8005}" --no-sout-audio
**MJPEG:**
cvlc v4l2:///dev/video0 --sout "#transcode{vcodec=mjpg,fps=24}:udp{dst=$IP:2000}" --no-sout-audio
