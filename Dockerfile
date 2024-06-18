FROM python:3.9.19-slim-bookworm
RUN apt-get -y update && apt-get install -y vim wget && mkdir /app && cd /app
WORKDIR /app
RUN wget https://github.com/novnc/noVNC/archive/refs/tags/v1.4.0.tar.gz \
 && wget https://github.com/novnc/websockify/archive/refs/tags/v0.12.0.tar.gz
RUN tar -zxf v1.4.0.tar.gz && tar -zxf v0.12.0.tar.gz && mv noVNC-1.4.0 noVNC && mv websockify-0.12.0 ./noVNC/utils/websockify
ENV PROXY_VNC=127.0.0.1:5900
ENV LISTEN_ADDR=0.0.0.0:8080
EXPOSE 8080
CMD ["/app/noVNC/utils/novnc_proxy", "--vnc", "${PROXY_VNC}", "--listen", "${LISTEN_ADDR}"]
