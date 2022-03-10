FROM python:alpine as builder
WORKDIR /mnt
RUN apk add gcc musl-dev linux-headers libffi-dev --no-cache && \
    /usr/local/bin/python -m pip install --upgrade pip && \
    pip3 install cffi && \
    pip3 wheel cryptg cffi

FROM python:alpine
ENV TZ=Asia/Shanghai

RUN adduser fei -D -G users -s /bin/sh && \
    apk add bash tzdata ca-certificates --no-cache && \
    wget https://github.com/alfem/telegram-download-daemon/archive/refs/heads/master.zip && \
    unzip master.zip && \
    rm -f master.zip && \
    mv telegram-download-daemon-master app

USER fei
WORKDIR /app
COPY --from=builder /mnt/*.whl /app/

RUN /usr/local/bin/python -m pip install --upgrade pip --no-warn-script-location && \
    /home/fei/.local/bin/pip3 install *.whl --no-warn-script-location && \
    /home/fei/.local/bin/pip3 install -U telethon --no-warn-script-location && \
    rm -f *.whl

VOLUME ["/downloads"]

CMD ["python", "./telegram-download-daemon.py"]
