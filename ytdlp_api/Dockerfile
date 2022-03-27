FROM python:alpine as builder
WORKDIR /mnt
RUN apk add gcc musl-dev linux-headers --no-cache && \
    /usr/local/bin/python -m pip install --upgrade pip && \
    pip3 wheel psutil && \
    pip3 wheel pycryptodomex && \
    chmod 777 /mnt/*

FROM python:alpine
LABEL org.opencontainers.image.source = "https://github.com/Felix2yu/docker_build" \
      maintainer="Felix2yu <yufei.im@icloud.com>" \
      org.opencontainers.image.authors="Felix2yu <yufei.im@icloud.com>"
ENV TZ=Asia/Shanghai
RUN adduser user -u 1000 -D -G users -s /bin/sh && \
    apk update && apk upgrade && \
    apk add ffmpeg bash curl tzdata ca-certificates --no-cache && \
    wget https://github.com/Totonyus/ydl_api/archive/refs/heads/master.zip && \
    unzip master.zip && \
    rm -f master.zip && \
    mv ydl_api-master app

USER user
WORKDIR /app
COPY --from=builder /mnt/*.whl /app/

RUN sed -i 's/youtube_dl/yt_dlp/g' ./*.py && \
    sed -i 's/youtube-dl/yt-dlp/g' ./*.py && \
    /usr/local/bin/python -m pip install --upgrade pip --no-warn-script-location && \
    /home/user/.local/bin/pip install ./*.whl --no-warn-script-location && \
    /home/user/.local/bin/pip install -U fastapi yt-dlp uvicorn --no-warn-script-location && \
    rm -f ./*.whl

VOLUME ["/app/downloads"]

CMD ["/home/user/.local/bin/uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
