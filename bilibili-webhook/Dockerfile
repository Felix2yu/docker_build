FROM rust:alpine as builder

WORKDIR /app

RUN apk add -qq --repository=https://dl-cdn.alpinelinux.org/alpine/edge/community musl-dev libc6-compat openssl-dev sqlite-dev tzdata git && \
    git clone https://github.com/LJason77/bilibili-webhook /app && \
    RUSTFLAGS="-C target-cpu=native" cargo build --release -q

FROM siguremo/yutto:latest
LABEL org.opencontainers.image.source = "https://github.com/Felix2yu/docker_build" \
      maintainer="Felix2yu <yufei.im@icloud.com>" \
      org.opencontainers.image.authors="Felix2yu <yufei.im@icloud.com>"

ENV TZ=Asia/Shanghai

COPY --from=builder /app/target/release/bilibili-webhook /usr/local/bin/
COPY --from=builder /app/log.yml .

RUN adduser -D -s /bin/sh -u 1000 -G users pi && chown -R pi:users .

USER pi

VOLUME ["/app/config", "/app/downloads"]

CMD ["bilibili-webhook"]