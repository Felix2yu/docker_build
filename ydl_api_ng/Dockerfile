FROM python:3-slim-bookworm as builder
ARG GIT_BRANCH=unknown GIT_REVISION=unknown DATE=unknown TARGETARCH
ENV UID=1000 GID=1000 GIT_BRANCH=$GIT_BRANCH GIT_REVISION=$GIT_REVISION DATE=$DATE NB_WORKERS=5 LOG_LEVEL="info" DISABLE_REDIS='false'
WORKDIR /mnt

RUN apt-get update && apt-get install -y dos2unix unzip wget xz-utils gcc g++ python3-dev && \
    wget https://github.com/Totonyus/ydl_api_ng/archive/refs/heads/main.zip && \
    unzip main.zip && \
    mkdir -p ./setup && \
    cp ydl_api_ng-main/*.py . && \
    cp ydl_api_ng-main/params/* ./setup/ && \
    cp ydl_api_ng-main/entrypoint.sh . && \
    cp ydl_api_ng-main/pip_requirements . && \
    mv setup/params_docker.ini ./setup/params.ini && \
    rm -rf main.zip ydl_api_ng-main && \
    chmod +x entrypoint.sh && \
    dos2unix * ./setup/* && \
    apt-get autoremove -y unzip wget xz-utils && \
    apt-get clean -y && rm -rf /var/lib/apt/lists/* && \
    /usr/local/bin/python -m pip install --upgrade pip && \
    pip3 wheel -r pip_requirements


FROM python:3-slim-bookworm
LABEL org.opencontainers.image.source = "https://github.com/Felix2yu/docker_build" \
      maintainer="Felix2yu <yufei.im@icloud.com>" \
      org.opencontainers.image.authors="Felix2yu <yufei.im@icloud.com>"
ARG GIT_BRANCH=unknown GIT_REVISION=unknown DATE=unknown TARGETARCH
ENV UID=1000 GID=1000 GIT_BRANCH=$GIT_BRANCH GIT_REVISION=$GIT_REVISION DATE=$DATE NB_WORKERS=5 LOG_LEVEL="info" DISABLE_REDIS='false' TZ=Asia/Shanghai
WORKDIR /app
COPY --from=builder /mnt/ /app/

RUN apt-get update && apt-get install -y bash tzdata ca-certificates wget xz-utils && \
    /usr/local/bin/python -m pip install --upgrade pip --no-warn-script-location && \
    pip install *.whl --no-warn-script-location && \
    rm -f *.whl && \
    case ${TARGETARCH} in \
            "amd64")  ARCH=amd64  ;; \
            "arm64")  ARCH=arm64  ;; \
    esac && \
    wget https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-$ARCH-static.tar.xz && \
    tar xvf ffmpeg-release-$ARCH-static.tar.xz && \
    rm -f ffmpeg-release-$ARCH-static.tar.xz && \
    cp ff*/ffmpeg ff*/ffprobe ff*/qt-faststart /usr/local/bin/ && \
    rm -rf ff* && \
    apt-get autoremove -y xz-utils wget && \
    apt-get clean -y && rm -rf /var/lib/apt/lists/*

CMD ["./entrypoint.sh"]
