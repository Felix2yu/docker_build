FROM python:alpine
LABEL org.opencontainers.image.source = "https://github.com/Felix2yu/docker_build" \
      maintainer="Felix2yu <yufei.im@icloud.com>" \
      org.opencontainers.image.authors="Felix2yu <yufei.im@icloud.com>"
ENV TZ=Asia/Shanghai
 
WORKDIR /app
RUN apk add bash tzdata ca-certificates git --no-cache && \
    git clone https://github.com/weekend-project-space/web2rss.git . && \
    /usr/local/bin/python -m pip install --upgrade pip --no-warn-script-location && \
    pip install requests beautifulsoup4 PyRSS2Gen lxml[html_clean] flask cachetools readability-lxml --no-warn-script-location
 
CMD ["python", "./app.py"]