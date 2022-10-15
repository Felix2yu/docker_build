FROM python:alpine
LABEL org.opencontainers.image.source = "https://github.com/Felix2yu/docker_build" \
      maintainer="Felix2yu <yufei.im@icloud.com>" \
      org.opencontainers.image.authors="Felix2yu <yufei.im@icloud.com>"
ENV TZ=Asia/Shanghai \
    SCHEDULE="@daily"

WORKDIR /app

RUN apk add bash tzdata ca-certificates supercronic --no-cache && \
    wget https://github.com/Felix2yu/docker-db-auto-backup/raw/master/requirements.txt && \
    pip install --no-cache-dir -r requirements.txt && \
    wget https://github.com/Felix2yu/docker-db-auto-backup/raw/master/db-auto-backup.py && \
    mkdir -p /var/backups

VOLUME ["/var/backups"]

CMD supercronic <(echo "$SCHEDULE" python3 db-auto-backup.py)
