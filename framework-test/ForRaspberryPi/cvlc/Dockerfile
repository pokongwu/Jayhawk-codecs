FROM    arm64v8/debian:buster-backports


RUN     apt-get update && apt-get install -y \
            vlc \
            v4l-utils \
	    libvpx5

RUN useradd -m vlcuser && usermod -aG video vlcuser

USER    vlcuser

COPY . .

ENTRYPOINT  ["/bin/bash"]
