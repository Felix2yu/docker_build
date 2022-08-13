FROM alpine:latest

LABEL org.opencontainers.image.source = "https://github.com/Felix2yu/docker_build" \
      maintainer="Felix2yu <yufei.im@icloud.com>" \
      org.opencontainers.image.authors="Felix2yu <yufei.im@icloud.com>"

ARG arch="amd64"
ENV OUTPUT_DIR="/download/bililive" \
    CONF_DIR="/etc/bililive-go" \
    PORT=8080 \
    TZ=Asia/Shanghai

RUN mkdir -p $OUTPUT_DIR && \
    mkdir -p $CONF_DIR && \
    apk update && \
    apk --no-cache add ca-certificates ffmpeg libc6-compat tzdata && \
    adduser user -u 1000 -D -G users -s /bin/sh && \
    wget -q https://github.com/Felix2yu/bililive-go/releases/latest/download/bililive-linux-$arch.tar.gz && \
    tar zxvf bililive-linux-$arch.tar.gz && \
    mv config.yml $CONF_DIR/config.yml && \
    chmod +x bililive-linux-$arch && \
    mv ./bililive-linux-$arch /usr/bin/bililive-go && \
    rm ./bililive-linux-$arch.tar.gz && \
    chown -R user:users /usr/bin/bililive-go $OUTPUT_DIR $CONF_DIR

USER user
VOLUME $OUTPUT_DIR
EXPOSE $PORT

ENTRYPOINT ["/usr/bin/bililive-go"]
CMD ["-c", "/etc/bililive-go/config.yml"]
