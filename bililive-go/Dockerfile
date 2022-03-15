FROM alpine:latest

LABEL org.opencontainers.image.source = "https://github.com/Felix2yu/docker_build" \
      maintainer="Felix2yu <yufei.im@icloud.com>" \
      org.opencontainers.image.authors="Felix2yu <yufei.im@icloud.com>"

ARG tag="v0.6.4-rc.2" \
    go_arch="amd64"
ENV OUTPUT_DIR="/download/bililive" \
    CONF_DIR="/etc/bililive-go" \
    PORT=8080 \
    TZ=Asia/Shanghai

RUN mkdir -p $OUTPUT_DIR && \
    mkdir -p $CONF_DIR && \
    apk update && \
    apk --no-cache add ca-certificates ffmpeg libc6-compat tzdata && \
    adduser user -u 1000 -D -G users -s /bin/sh && \
    wget -q https://github.com/hr3lxphr6j/bililive-go/releases/download/$tag/bililive-linux-$go_arch.tar.gz && \
    tar zxvf bililive-linux-$go_arch.tar.gz && \
    mv config.yml $CONF_DIR/config.yml && \
    chmod +x bililive-linux-$go_arch && \
    mv ./bililive-linux-$go_arch /usr/bin/bililive-go && \
    rm ./bililive-linux-$go_arch.tar.gz && \
    chown -R user:users /usr/bin/bililive-go $OUTPUT_DIR $CONF_DIR

USER user
VOLUME $OUTPUT_DIR
EXPOSE $PORT

ENTRYPOINT ["/usr/bin/bililive-go"]
CMD ["-c", "/etc/bililive-go/config.yml"]