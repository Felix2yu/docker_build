FROM alpine:latest

LABEL org.opencontainers.image.source = "https://github.com/Felix2yu/docker_build" \
      maintainer="Felix2yu <yufei.im@icloud.com>" \
      org.opencontainers.image.authors="Felix2yu <yufei.im@icloud.com>"

ARG TARGETARCH VERSION=1.0.0-alpha0
ENV TZ=Asia/Shanghai

RUN apk update && \
    apk --no-cache add ca-certificates tzdata && \
    case ${TARGETARCH} in \
            "amd64")  ARCH=x86_64  ;; \
            "arm64")  ARCH=aarch64 ;; \
            "386")    ARCH=i686   ;; \
    esac && \
    wget -q https://github.com/EAimTY/tuic/releases/download/tuic-server-${VERSION}/tuic-server-${VERSION}-${ARCH}-unknown-linux-musl && \
    chmod +x tuic-server-${VERSION}-${ARCH}-unknown-linux-musl && \
    mv ./tuic-server-${VERSION}-${ARCH}-unknown-linux-musl /usr/bin/tuic-server

VOLUME /etc/tuic/config.json
EXPOSE 443

CMD ["/usr/bin/tuic-server", "-c", "/etc/tuic/config.json"]
