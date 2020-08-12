FROM    arm64v8/debian:buster-backports

RUN     apt-get update && apt-get install -y \
            ffmpeg \
            v4l-utils

COPY . .

ENTRYPOINT  ["/bin/bash"]
