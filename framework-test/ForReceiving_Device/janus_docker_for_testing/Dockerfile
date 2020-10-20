FROM	ubuntu:latest

WORKDIR	/janusServer
COPY	run.sh .

# Check required dependencies
RUN apt-get update && apt-get install -y \
	libmicrohttpd-dev \
	libjansson-dev \
	libnice-dev \
	libssl-dev \
	libsrtp-dev \
	libsofia-sip-ua-dev \
	libglib2.0-dev \
	libopus-dev \
	libogg-dev \
	libini-config-dev \
	libcollection-dev \
	pkg-config \
	gengetopt \
	libtool \
	automake \
	dh-autoreconf \
	git \
	libconfig-dev \
	libsrtp2-dev \
	nginx

RUN git clone https://github.com/meetecho/janus-gateway.git
RUN cd janus-gateway && \
	sh autogen.sh && \
	./configure --disable-websockets --disable-data-channels --disable-rabbitmq --disable-docs --prefix=/opt/janus && \
	make && \
	make install
RUN	cd janus-gateway && make configs

COPY	janus.plugin.streaming.jcfg /opt/janus/etc/janus/janus.plugin.streaming.jcfg

RUN cp -r /opt/janus/share/janus/demos/* /var/www/html
RUN chmod +x /janusServer/run.sh

ENTRYPOINT ["/janusServer/run.sh"]
