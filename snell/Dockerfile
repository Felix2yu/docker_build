FROM alpine:latest

ENV TZ=Asia/Shanghai
ARG GLIBC_VERSION="2.35-r0" \
    SNELL_VERSION="3.0.1"

RUN apk update && apk upgrade && \
    apk add --update curl tzdata libstdc++ && \
    wget -q -O "/etc/apk/keys/sgerrand.rsa.pub" https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
    wget -q -O "glibc.apk" "https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-${GLIBC_VERSION}.apk" && \
    wget -q -O "glibc-bin.apk" "https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-bin-${GLIBC_VERSION}.apk" && \
    apk add glibc-bin.apk glibc.apk && \
    /usr/glibc-compat/sbin/ldconfig /lib /usr/glibc-compat/lib && \
    echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' >> /etc/nsswitch.conf && \
    rm -rf glibc.apk glibc-bin.apk /var/cache/apk/* && \
    wget -q -O "snell-server.zip" https://github.com/surge-networks/snell/releases/download/v${SNELL_VERSION}/snell-server-v${SNELL_VERSION}-linux-amd64.zip && \
    unzip snell-server.zip && \
    mv snell-server /usr/bin/ && \
    rm snell-server.zip

CMD ["/usr/bin/snell-server", "-c", "/etc/snell-server.conf"]