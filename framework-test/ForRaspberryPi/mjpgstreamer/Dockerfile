FROM arm32v7/debian:stable-slim

WORKDIR /app
COPY mjpg-streamer ./mjpg-streamer
COPY run.sh .

RUN chmod +x ./run.sh

RUN apt-get update && apt-get install -y \
	libjpeg-dev \
	build-essential \
	imagemagick \
	libv4l-dev \
	cmake

RUN cd ./mjpg-streamer && \
	make && \
	make install

EXPOSE 8085

ENTRYPOINT ["/app/run.sh"]
