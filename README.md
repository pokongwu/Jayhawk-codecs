## Jayhawk-codecs

We built a multimedia system that uses RTP on the Raspberry Pi 4. 

Our system receives video data
from the attached camera node, this video data is encoded and decoded by using video
codecs (H.264 and MJPEG) and sent over the network using a RTP. 

We view the video files on the receiving device using the web browser or media-player (VLC).

Everything was virtualized with Docker and deployed on Raspberry Pi.

## Technoloiges used ##
 Raspberry Pi 3: Linux Black-pearl 4.19.58-hypriotos-v8, aarch64 1.2GHz ARM

 Raspberry Pi 4: Linux Black-pearl 4.19.102-v8, aarch64 1.5GHz ARM

 Docker: v18.09.7

 cAdvisor: v0.36.0

 Prometheus: v2.21.0

 Jupyter Notebook: v6.1.3

 Frameworks: arm64v8/debian:buster-backports v0.11

 Janus (WebRTC server): v0.10.3

## To use
To start the containers with Cadvisor running on the background.

Navigate to framework-test/ForRaspberryPi ./startFwCadvisor.sh