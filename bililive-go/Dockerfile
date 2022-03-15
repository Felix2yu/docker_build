FROM alpine:latest

ARG tag="v0.6.4-rc.2"
ENV OUTPUT_DIR="/download/bililive" \
    CONF_DIR="/etc/bililive-go" \
    PORT=8080 \
    TZ=Asia/Shanghai

RUN mkdir -p $OUTPUT_DIR && \
    mkdir -p $CONF_DIR && \
    apk update && \
    apk --no-cache add ffmpeg libc6-compat tzdata && \
    adduser user -u 1000 -D -G users -s /bin/sh && \
    sh -c "case $(arch) in arm64) go_arch=arm64 ;; x86_64) go_arch=amd64;; esac && \
    wget -q https://github.com/hr3lxphr6j/bililive-go/releases/download/$tag/bililive-linux-\${go_arch}.tar.gz && \
    tar zxvf bililive-linux-\${go_arch}.tar.gz bililive-linux-\${go_arch} && \
    chmod +x bililive-linux-\${go_arch} && \
    mv ./bililive-linux-\${go_arch} /usr/bin/bililive-go && \
    rm ./bililive-linux-\${go_arch}.tar.gz && \
    chown user:users /usr/bin/bililive-go $OUTPUT_DIR $CONF_DIR" && \
    sh -c "if [ $tag != $(/usr/bin/bililive-go --version | tr -d '\n') ]; then return 1; fi"

COPY config.docker.yml $CONF_DIR/config.yml

USER user
VOLUME $OUTPUT_DIR
EXPOSE $PORT

ENTRYPOINT ["/usr/bin/bililive-go"]
CMD ["-c", "/etc/bililive-go/config.yml"]