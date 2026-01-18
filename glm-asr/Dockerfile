FROM ubuntu
LABEL org.opencontainers.image.source = "https://github.com/Felix2yu/docker_build" \
      maintainer="Felix2yu <yufei.im@icloud.com>" \
      org.opencontainers.image.authors="Felix2yu <yufei.im@icloud.com>"

ARG PROXY=""
ENV all_proxy=${PROXY}
      
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y ffmpeg git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
      
ENV UV_LINK_MODE=copy
COPY --from=ghcr.io/astral-sh/uv /uv /uvx /bin/
WORKDIR /app
RUN git clone https://github.com/wujunwei928/GLM-ASR-WebUI .
RUN --mount=type=cache,target=/root/.cache/uv uv sync
      
CMD ["uv", "run", "uvicorn", "glm_asr.app:app", "--reload"]
