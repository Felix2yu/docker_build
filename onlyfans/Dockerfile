FROM python:3.9-slim

LABEL org.opencontainers.image.source = "https://github.com/Felix2yu/docker_build" \
      maintainer="Felix2yu <yufei.im@icloud.com>" \
      org.opencontainers.image.authors="Felix2yu <yufei.im@icloud.com>"

WORKDIR /app
RUN apt-get update && apt-get install -yq git --no-install-recommends && \
    git clone https://github.com/Felix2yu/OnlyFans . && \
    pip install --no-cache-dir -r requirements.txt && \
    apt-get autoremove -y git && \
    rm -rf /var/cache/apt

VOLUME /app/.settings \
       /app/.profiles \
       /app/.sites

CMD [ "python", "/app/start_ofd.py" ]
