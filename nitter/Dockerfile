FROM nimlang/nim:2.0.2-alpine-regular as builder
LABEL org.opencontainers.image.source = "https://github.com/Felix2yu/docker_build" \
      maintainer="Felix2yu <yufei.im@icloud.com>" \
      org.opencontainers.image.authors="Felix2yu <yufei.im@icloud.com>"

RUN apk --no-cache add libsass-dev pcre

WORKDIR /src/nitter

RUN git clone https://github.com/PrivacyDevel/nitter . && \
    nimble install -y --depsOnly && \
    nimble build -d:danger -d:lto -d:strip && \
    nimble scss && \
    nimble md

FROM alpine:latest
WORKDIR /app/
RUN apk --no-cache add pcre ca-certificates tzdata
COPY --from=builder /src/nitter/nitter ./
COPY --from=builder /src/nitter/nitter.example.conf ./nitter.conf
COPY --from=builder /src/nitter/public ./public
EXPOSE 8080
RUN adduser -h /app/ -u 1000 -D -G users -s /bin/sh nitter
USER nitter
CMD ["/app/nitter"]
