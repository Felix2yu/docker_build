FROM alpine:latest

LABEL org.opencontainers.image.source = "https://github.com/Felix2yu/docker_build" \
      maintainer="Felix2yu <yufei.im@icloud.com>" \
      org.opencontainers.image.authors="Felix2yu <yufei.im@icloud.com>"

ARG TARGETARCH
ENV OUTPUT_DIR="/download/bililive" \
    CONF_DIR="/etc/bililive-go" \
    PORT=8080 \
    TZ=Asia/Shanghai

RUN mkdir -p $OUTPUT_DIR && \
    mkdir -p $CONF_DIR && \
    apk update && \
    apk --no-cache add ca-certificates ffmpeg libc6-compat tzdata && \
    adduser user -u 1000 -D -G users -s /bin/sh && \
    case ${TARGETARCH} in \
            "amd64")  ARCH=amd64  ;; \
            "arm64")  ARCH=arm64  ;; \
            "386")    ARCH=386   ;; \
    esac && \
    wget -q https://github.com/Felix2yu/bililive-go/releases/latest/download/bililive-linux-$ARCH.tar.gz && \
    tar zxvf bililive-linux-$ARCH.tar.gz && \
    mv config.yml $CONF_DIR/config.yml && \
    chmod +x bililive-linux-$ARCH && \
    mv ./bililive-linux-$ARCH /usr/bin/bililive-go && \
    rm ./bililive-linux-$ARCH.tar.gz && \
    chown -R user:users /usr/bin/bililive-go $OUTPUT_DIR $CONF_DIR

USER user
VOLUME $OUTPUT_DIR
EXPOSE $PORT

ENTRYPOINT ["/usr/bin/bililive-go"]
CMD ["-c", "/etc/bililive-go/config.yml"]
