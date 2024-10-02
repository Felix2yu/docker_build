FROM python:alpine
LABEL org.opencontainers.image.source = "https://github.com/Felix2yu/docker_build" \
      maintainer="Felix2yu <yufei.im@icloud.com>" \
      org.opencontainers.image.authors="Felix2yu <yufei.im@icloud.com>"
ENV TZ=Asia/Shanghai PYTHONDONTWRITEBYTECODE=1 PYTHONUNBUFFERED=1
 
WORKDIR /app
RUN apk add bash tzdata ca-certificates git cronie --no-cache && \
    git clone https://github.com/yinan-c/RSSbrew . && \
    /usr/local/bin/python -m pip install --upgrade pip --no-warn-script-location && \
    pip install --no-cache-dir -r requirements.txt --no-warn-script-location && \
    chmod +x /app/scripts/update_feeds.sh /app/scripts/entrypoint.sh
 
EXPOSE 8000
ENTRYPOINT ["/app/scripts/entrypoint.sh"]