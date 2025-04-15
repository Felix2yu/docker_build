FROM oven/bun:1-slim AS base
WORKDIR /app
RUN apt-get update && \
    apt-get install -y git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
RUN git clone https://github.com/2977094657/BiliHistoryFrontend .

FROM base AS install
RUN bun install --frozen-lockfile

FROM base AS build
COPY --from=install /app/node_modules node_modules
RUN bun run build

FROM caddy:2-alpine AS release
LABEL org.opencontainers.image.source = "https://github.com/Felix2yu/docker_build" \
      maintainer="Felix2yu <yufei.im@icloud.com>" \
      org.opencontainers.image.authors="Felix2yu <yufei.im@icloud.com>"

COPY --from=build /app/dist /app
COPY --from=build /app/deploy/Caddyfile /etc/caddy

EXPOSE 80
