FROM alpine:latest
LABEL org.opencontainers.image.source = "https://github.com/Felix2yu/docker_build" \
      maintainer="Felix2yu <yufei.im@icloud.com>" \
      org.opencontainers.image.authors="Felix2yu <yufei.im@icloud.com>"

ENV WEBUI_PORT=8989 \
    PEER_PORT=12306 \
    UID=1000 \
    GID=100 \
    UMASK=022 \
    TZ=Asia/Shanghai

COPY rootfs /

RUN apk add --no-cache tzdata curl s6 bash ca-certificates && \
    wget https://github.com/c0re100/qBittorrent-Enhanced-Edition/releases/latest/download/qbittorrent-enhanced-nox_x86_64-linux-musl_static.zip && \
    unzip qbittorrent-enhanced-nox_x86_64-linux-musl_static.zip && \
    rm -f qbittorrent-enhanced-nox_x86_64-linux-musl_static.zip && \
    mv qbittorrent-nox /usr/local/bin/qbittorrent-nox && \
    chmod a+x /usr/local/bin/qbittorrent-nox /init

VOLUME /config

EXPOSE $WEBUI_PORT \
       $PEER_PORT \
       $PEER_PORT/udp

ENTRYPOINT "/init"

HealthCheck --interval=60s --timeout=3s --retries=3 \
  CMD curl -m 5 -fs http://localhost:{$WEBUI_PORT} || exit 1
