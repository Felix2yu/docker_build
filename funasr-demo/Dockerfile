FROM alpine
LABEL org.opencontainers.image.source = "https://github.com/Felix2yu/docker_build" \
      maintainer="Felix2yu <yufei.im@icloud.com>" \
      org.opencontainers.image.authors="Felix2yu <yufei.im@icloud.com>"

ARG TARGETARCH
WORKDIR /app
COPY main.js recorder-core.js wsconnecter.js index.html pcm.js wav.js .
RUN case ${TARGETARCH} in \
            "amd64")  ARCH=x86_64  ;; \
            "arm64")  ARCH=aarch64  ;; \
    esac && \
    wget https://github.com/TheWaWaR/simple-http-server/releases/latest/download/$ARCH-unknown-linux-musl-simple-http-server && \
    mv $ARCH-unknown-linux-musl-simple-http-server /usr/local/bin/simple-http-server && \
    chmod +x /usr/local/bin/simple-http-server
    
CMD ["/usr/local/bin/simple-http-server", "--upload-size-limit", "200000000", "--index", "--upload"]
