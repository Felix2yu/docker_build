FROM alpine:latest

LABEL org.opencontainers.image.source = "https://github.com/Felix2yu/docker_build" \
      maintainer="Felix2yu <yufei.im@icloud.com>" \
      org.opencontainers.image.authors="Felix2yu <yufei.im@icloud.com>"

ARG tag="v0.2.15" \
    arch="amd64"
ENV OUTPUT_DIR="/download" \
    CONF_DIR="/etc/olive" \
    TZ=Asia/Shanghai

RUN mkdir -p $OUTPUT_DIR && \
    mkdir -p $CONF_DIR && \
    apk update && \
    apk --no-cache add ca-certificates tzdata && \
    adduser user -u 1000 -D -G users -s /bin/sh && \
    wget -q https://github.com/go-olive/olive/releases/latest/download/olive_$tag_linux_$arch.tar.gz && \
    tar zxvf olive_$tag_linux_$arch.tar.gz && \
    chmod +x olive_$tag_linux_$arch/olive && \
    mv ./olive_$tag_linux_$arch/olive /usr/bin/olive && \
    rm -rf ./olive_$tag_linux_$arch.tar.gz ./olive_$tag_linux_$arch && \
    chown -R user:users /usr/bin/olive $OUTPUT_DIR $CONF_DIR

USER user
VOLUME $OUTPUT_DIR \
       $CONF_DIR/config.toml

CMD ["olive", "-c", "CONF_DIR/config.toml"]