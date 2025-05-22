FROM oven/bun:1-slim AS base
WORKDIR /src
RUN apt-get update && \
    apt-get install -y git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    git clone https://github.com/2977094657/BiliHistoryFrontend .

FROM oven/bun:1-slim AS install
WORKDIR /src
RUN apt-get update && \
    apt-get install -y wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    wget https://raw.githubusercontent.com/2977094657/BiliHistoryFrontend/refs/heads/master/bun.lock && \
    wget https://raw.githubusercontent.com/2977094657/BiliHistoryFrontend/refs/heads/master/package.json && \
    bun install

FROM base AS build
COPY --from=install /src/node_modules node_modules
RUN bun run build

FROM caddy:2-alpine AS release
LABEL org.opencontainers.image.source = "https://github.com/Felix2yu/docker_build" \
      maintainer="Felix2yu <yufei.im@icloud.com>" \
      org.opencontainers.image.authors="Felix2yu <yufei.im@icloud.com>"

WORKDIR /app
COPY --from=build /src/dist /app
COPY --from=build /src/deploy/Caddyfile /etc/caddy

EXPOSE 80
