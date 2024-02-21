FROM debian:stable

LABEL org.opencontainers.image.source = "https://github.com/Felix2yu/docker_build" \
      maintainer="Felix2yu <yufei.im@icloud.com>" \
      org.opencontainers.image.authors="Felix2yu <yufei.im@icloud.com>"

ENV FASTDFS_PATH=/opt/fdfs \
    FASTDFS_BASE_PATH=/data/fdfs \
    TZ=Asia/Shanghai \
    FASTDFS_MODE= \
    LIBFASTCOMMON_VERSION="V1.0.42" \
    FASTDFS_VERSION="V5.12"

COPY entrypoint.sh /usr/bin/

RUN chmod +x /usr/bin/entrypoint.sh && \
    apt-get update && \
    apt-get install -y git gcc make && \
    mkdir -p ${FASTDFS_BASE_PATH} ${FASTDFS_PATH}/libfastcommon ${FASTDFS_PATH}/fastdfs && \
    git clone -b $LIBFASTCOMMON_VERSION https://github.com/happyfish100/libfastcommon.git ${FASTDFS_PATH}/libfastcommon && \
    cd ${FASTDFS_PATH}/libfastcommon && \
    ./make.sh && \
    ./make.sh install && \
    git clone -b $FASTDFS_VERSION https://github.com/happyfish100/fastdfs.git ${FASTDFS_PATH}/fastdfs && \
    cd ${FASTDFS_PATH}/fastdfs && \
    ./make.sh && \
    ./make.sh install && \
    apt-get autoremove -y git gcc make && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt

EXPOSE 22122 23000
VOLUME ["$FASTDFS_BASE_PATH","/etc/fdfs"]

ENTRYPOINT ["/usr/bin/entrypoint.sh"]