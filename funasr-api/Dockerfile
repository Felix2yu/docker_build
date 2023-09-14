FROM registry.cn-hangzhou.aliyuncs.com/funasr_repo/funasr:funasr-runtime-sdk-cpu-0.2.1
LABEL org.opencontainers.image.source = "https://github.com/Felix2yu/docker_build" \
      maintainer="Felix2yu <yufei.im@icloud.com>" \
      org.opencontainers.image.authors="Felix2yu <yufei.im@icloud.com>"

WORKDIR /workspace/FunASR/funasr/runtime
COPY ./startup.sh .
VOLUME /workspace/models
CMD ["bash", "startup.sh"]
