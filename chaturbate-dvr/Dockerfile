FROM golang:latest as backendbuild

WORKDIR /src/chaturbate-dvr

RUN git clone https://github.com/teacat/chaturbate-dvr . && \
    go mod download && \
    go mod verify && \
    go build


FROM debian:stable-slim

LABEL org.opencontainers.image.source = "https://github.com/Felix2yu/docker_build" \
      maintainer="Felix2yu <yufei.im@icloud.com>" \
      org.opencontainers.image.authors="Felix2yu <yufei.im@icloud.com>"

ENV TZ=Asia/Shanghai

WORKDIR /app
COPY --from=backendbuild /src/chaturbate-dvr/chaturbate-dvr chaturbate-dvr

RUN chmod +x chaturbate-dvr

VOLUME /app/video
EXPOSE 8080
CMD [ "/app/chaturbate-dvr" ]
