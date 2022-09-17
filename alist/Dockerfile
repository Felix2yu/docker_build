FROM alpine:latest

LABEL org.opencontainers.image.source = "https://github.com/Felix2yu/docker_build" \
      maintainer="Felix2yu <yufei.im@icloud.com>" \
      org.opencontainers.image.authors="Felix2yu <yufei.im@icloud.com>"

ARG TARGETARCH
ENV TZ=Asia/Shanghai \
    VERSION=v3.0.0-rc.0

WORKDIR /alist
RUN mkdir -p /alist && \
    apk update && \
    apk --no-cache add ca-certificates tzdata && \
    adduser user -u 1000 -D -G users -s /bin/sh && \
    wget -q https://github.com/alist-org/alist/releases/download/${VERSION}/alist-linux-musl-amd64.tar.gz && \
    tar zxvf alist-linux-musl-amd64.tar.gz && \
    chmod +x alist && \
    mv ./alist /alist/alist && \
    rm ./alist-linux-musl-amd64.tar.gz && \
    chown user:users /alist/alist

USER user
VOLUME /alist/data
EXPOSE 5244

CMD [ "./alist", "server", "--no-prefix" ]
