FROM debian:stable-slim

LABEL org.opencontainers.image.source = "https://github.com/Felix2yu/docker_build" \
      maintainer="Felix2yu <yufei.im@icloud.com>" \
      org.opencontainers.image.authors="Felix2yu <yufei.im@icloud.com>"

ARG TARGETARCH
ENV TZ=Asia/Shanghai
ARG SNELL_VERSION="v4.0.1"

RUN apt-get update && apt-get install --no-install-recommends -y wget tzdata unzip && \
    case ${TARGETARCH} in \
            "amd64")  ARCH=amd64  ;; \
            "arm64")  ARCH=aarch64  ;; \
            "386")    ARCH=i386   ;; \
    esac && \
    wget --no-check-certificate -q -O "snell-server.zip" https://dl.nssurge.com/snell/snell-server-${SNELL_VERSION}-linux-${ARCH}.zip && \
    unzip snell-server.zip && \
    rm snell-server.zip && \
    mv snell-server /usr/bin/ && \
    apt-get autoremove -y unzip wget && apt-get clean -y && rm -rf /var/lib/apt/lists/* /var/cache/apt

CMD ["/usr/bin/snell-server", "-c", "/etc/snell-server.conf"]
