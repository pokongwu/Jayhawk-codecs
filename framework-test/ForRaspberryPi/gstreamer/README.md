# gstreamer
## Running command on pi
docker run -it --privileged --net=host -v /dev/video0:/dev/video0 -e IP="IP_of_Receiver" gstreamer

### Commands for testing:
**H.264:**
gst-launch-1.0 v4l2src device=/dev/video0 \
    ! video/x-raw,width=640,height=480,codec=h264,type=video \
    ! videoscale \
    ! videoconvert \
    ! x264enc tune=zerolatency \
    ! rtph264pay \
    ! udpsink host=$IP port=8004

**VP8:**
gst-launch-1.0 v4l2src device=/dev/video0 \
    ! video/x-raw,width=640,height=480 \
    ! videoscale \
    ! videoconvert \
    ! vp8enc deadline=1 \
    ! rtpvp8pay \
    ! udpsink host=$IP port=8005

**MJPEG:**
gst-launch-1.0 v4l2src device=/dev/video0 \
    ! video/x-raw,width=640,height=480,type=video \
    ! videoscale \
    ! videoconvert \
    ! jpegenc \
    ! rtpjpegpay pt=96 \
    ! udpsink host=$IP port=2000
