FROM clux/muslrust as builder
WORKDIR /usr/src/app

RUN git clone https://github.com/kittyandrew/grafana-to-ntfy . && \
    rustup target add x86_64-unknown-linux-musl && \
    cargo install --locked --target x86_64-unknown-linux-musl --path .

FROM alpine

LABEL org.opencontainers.image.source = "https://github.com/Felix2yu/docker_build" \
      maintainer="Felix2yu <yufei.im@icloud.com>" \
      org.opencontainers.image.authors="Felix2yu <yufei.im@icloud.com>"

WORKDIR /app
COPY --from=builder /root/.cargo/bin/grafana-to-ntfy .
RUN apk add --no-cache curl && \
    wget https://github.com/kittyandrew/grafana-to-ntfy/raw/master/Rocket.toml

ENTRYPOINT ["./grafana-to-ntfy"]
HEALTHCHECK --interval=10s --timeout=3s \
  CMD curl -sf 0.0.0.0:8080/health || exit 1