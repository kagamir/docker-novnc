FROM python:3.9.19-slim-bookworm

ARG NOVNC_VERSION=v1.6.0
ARG WEBSOCKIFY_VERSION=v0.13.0

RUN apt-get -y update && apt-get install -y vim wget procps && mkdir /app && cd /app
WORKDIR /app
RUN wget https://github.com/novnc/noVNC/archive/refs/tags/${NOVNC_VERSION}.tar.gz \
 && wget https://github.com/novnc/websockify/archive/refs/tags/${WEBSOCKIFY_VERSION}.tar.gz \
 && tar -zxf ${NOVNC_VERSION}.tar.gz \
 && tar -zxf ${WEBSOCKIFY_VERSION}.tar.gz \
 && rm -rf ${NOVNC_VERSION}.tar.gz ${WEBSOCKIFY_VERSION}.tar.gz \
 && mv noVNC-${NOVNC_VERSION#v} noVNC \
 && mv websockify-${WEBSOCKIFY_VERSION#v} ./noVNC/utils/websockify

ENV PROXY_VNC=127.0.0.1:5900
ENV LISTEN_ADDR=0.0.0.0:8080
EXPOSE 8080
CMD /app/noVNC/utils/novnc_proxy --vnc $PROXY_VNC --listen $LISTEN_ADDR
