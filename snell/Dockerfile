FROM jeanblanchard/alpine-glibc:3.15

ARG SNELL_VERSION="3.0.1"

ENV TZ=Asia/Shanghai

WORKDIR /tmp

RUN apk add --update tzdata libstdc++ && rm -rf /var/cache/apk/* && \
    wget -q -O "snell-server.zip" https://github.com/surge-networks/snell/releases/download/v${SNELL_VERSION}/snell-server-v${SNELL_VERSION}-linux-amd64.zip && \
    unzip snell-server.zip && \
    mv snell-server /usr/bin/ && rm snell-server.zip

CMD ["/usr/bin/snell-server", "-c", "/etc/snell-server.conf"]
