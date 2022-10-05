FROM nimlang/nim:alpine as builder
WORKDIR /usr/src/app
RUN apk update && apk --no-cache add libpq-dev postgresql14-dev postgresql-libs gcc libc-dev && \
    wget https://github.com/mahlonsmith/netdata-timescale-relay/raw/master/netdata_tsrelay.nim && \
    nim c --passL:"-static -no-pie" netdata_tsrelay.nim

FROM alpine:latest
LABEL org.opencontainers.image.source = "https://github.com/Felix2yu/docker_build" \
      maintainer="Felix2yu <yufei.im@icloud.com>" \
      org.opencontainers.image.authors="Felix2yu <yufei.im@icloud.com>"

ENV TZ=Asia/Shanghai \
    HOST=localhost \
    PORT=5432 \
    DBNAME=netdata \
    USER=netdata \
    PASSWORD=password \
    APPLICATION_NAME=netdata-tsrelay

WORKDIR /app
COPY --from=builder /usr/src/app/netdata_tsrelay /app/netdata_tsrelay
RUN apk update && apk --no-cache add libpq
CMD ["/app/netdata_tsrelay", "--dbopts", "host=$HOST port=$PORT dbname=$DBNAME user=$USER password=$PASSWORD application_name=$APPLICATION_NAME"]
