FROM ghcr.io/linuxserver/qbittorrent:latest
LABEL org.opencontainers.image.source = "https://github.com/Felix2yu/docker_build" \
      maintainer="Felix2yu <yufei.im@icloud.com>" \
      org.opencontainers.image.authors="Felix2yu <yufei.im@icloud.com>"

ARG TARGETARCH
ENV WEBUI_PORT=8080 \
    PUID=1000 \
    PGID=100 \
    TZ=Asia/Shanghai

RUN case ${TARGETARCH} in \
            "amd64")  ARCH=x86_64  ;; \
            "arm64")  ARCH=aarch64  ;; \
    esac && \
    wget https://github.com/c0re100/qBittorrent-Enhanced-Edition/releases/latest/download/qbittorrent-enhanced-nox_$ARCH-linux-musl_static.zip && \
    unzip qbittorrent-enhanced-nox_$ARCH-linux-musl_static.zip && \
    rm -f qbittorrent-enhanced-nox_$ARCH-linux-musl_static.zip && \
    mv qbittorrent-nox /usr/bin/qbittorrent-nox && \
    chmod a+x /usr/bin/qbittorrent-nox
