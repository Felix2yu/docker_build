FROM python:3-slim

LABEL org.opencontainers.image.source = "https://github.com/Felix2yu/docker_build" \
      maintainer="Felix2yu <yufei.im@icloud.com>" \
      org.opencontainers.image.authors="Felix2yu <yufei.im@icloud.com>"

WORKDIR /app
RUN git clone https://github.com/DIGITALCRIMINAL/OnlyFans . && \
    pip install --no-cache-dir -r requirements.txt

VOLUME /app/.settings \
       /app/.profiles \
       /app/.sites

CMD [ "python", "./start_ofd.py" ]