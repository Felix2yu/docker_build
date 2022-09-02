FROM python:alpine as builder
WORKDIR /mnt
RUN apk add gcc musl-dev linux-headers libffi-dev --no-cache && \
    /usr/local/bin/python -m pip install --upgrade pip && \
    pip3 install cffi && \
    pip3 wheel cryptg==0.3.1 cffi telethon

FROM python:alpine
LABEL org.opencontainers.image.source = "https://github.com/Felix2yu/docker_build" \
      maintainer="Felix2yu <yufei.im@icloud.com>" \
      org.opencontainers.image.authors="Felix2yu <yufei.im@icloud.com>"
ENV TZ=Asia/Shanghai

RUN adduser user -D -G users -s /bin/sh && \
    apk add bash tzdata ca-certificates --no-cache && \
    wget https://github.com/alfem/telegram-download-daemon/archive/refs/heads/master.zip && \
    unzip master.zip && \
    rm -f master.zip && \
    mv telegram-download-daemon-master app

USER user
WORKDIR /app
COPY --from=builder /mnt/*.whl /app/

RUN /usr/local/bin/python -m pip install --upgrade pip --no-warn-script-location && \
    pip install *.whl --no-warn-script-location && \
    pip install -U telethon --no-warn-script-location && \
    rm -f *.whl

VOLUME ["/downloads"]

CMD ["python", "./telegram-download-daemon.py"]
