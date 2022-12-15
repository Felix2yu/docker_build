FROM python:3.9-slim-buster
LABEL org.opencontainers.image.source = "https://github.com/Felix2yu/docker_build" \
      maintainer="Felix2yu <yufei.im@icloud.com>" \
      org.opencontainers.image.authors="Felix2yu <yufei.im@icloud.com>"
ARG GIT_BRANCH=unknown GIT_REVISION=unknown DATE=unknown TARGETARCH
ENV UID=1000 GID=1000 GIT_BRANCH=$GIT_BRANCH GIT_REVISION=$GIT_REVISION DATE=$DATE NB_WORKERS=5 LOG_LEVEL="info" DISABLE_REDIS='false'
WORKDIR /app

RUN apt-get update && apt-get install -y dos2unix unzip wget xz-utils && \
    wget https://github.com/Totonyus/ydl_api_ng/archive/refs/heads/develop.zip && \
    unzip develop.zip && \
    mkdir -p /app/setup && \
    cp ydl_api_ng-develop/*.py . && \
    cp ydl_api_ng-develop/params/* ./setup/ && \
    cp ydl_api_ng-develop/entrypoint.sh . && \
    cp ydl_api_ng-develop/pip_requirements . && \
    mv setup/params_docker.ini ./setup/params.ini && \
    rm -rf develop.zip ydl_api_ng-develop && \
    chmod +x entrypoint.sh && \
    dos2unix * ./setup/* && \
    case ${TARGETARCH} in \
            "amd64")  ARCH=amd64  ;; \
            "arm64")  ARCH=arm64  ;; \
            "386")    ARCH=i686   ;; \
    esac && \
    wget https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-$ARCH-static.tar.xz && \
    tar xvf ffmpeg-release-$ARCH-static.tar.xz && \
    rm -f ffmpeg-release-$ARCH-static.tar.xz && \
    cp ff*/ffmpeg ff*/ffprobe ff*/qt-faststart /usr/local/bin/ && \
    rm -rf ff* && \
    apt-get autoremove -y unzip wget xz-utils && \
    apt-get clean -y && rm -rf /var/lib/apt/lists/* && \
    /usr/local/bin/python -m pip install --upgrade pip && \
    pip3 install -r pip_requirements

CMD ["./entrypoint.sh"]
