FROM alpine:latest

LABEL org.opencontainers.image.source = "https://github.com/Felix2yu/docker_build" \
      maintainer="Felix2yu <yufei.im@icloud.com>" \
      org.opencontainers.image.authors="Felix2yu <yufei.im@icloud.com>"

ENV TZ=Asia/Shanghai \
    ROCKET_ADDRESS=0.0.0.0 \
    ROCKET_PORT=80

COPY deepl /
RUN apk update && \
    apk add --no-cache ca-certificates tzdata openssl libgcc && \
    chmod +x /deepl

EXPOSE 80

ENTRYPOINT ["/deepl"]
