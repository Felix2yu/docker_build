FROM node:slim as dep-builder

WORKDIR /app

RUN ln -sf /bin/bash /bin/sh && \
    apt-get update && apt-get install -yq libgconf-2-4 apt-transport-https git dumb-init python3 build-essential ca-certificates wget --no-install-recommends && \
    wget https://github.com/DIYgod/RSSHub/raw/master/yarn.lock && \
    wget https://github.com/DIYgod/RSSHub/raw/master/package.json && \
    npm i -g npm && \
    yarn --frozen-lockfile --network-timeout 1000000 && \
    git clone https://github.com/DIYgod/RSSHub && \
    mv RSSHub/* . && \
    rm -rf RSSHub && \
    node scripts/docker/minify-docker.js

FROM node:slim as app
LABEL org.opencontainers.image.source = "https://github.com/Felix2yu/docker_build" \
      maintainer="Felix2yu <yufei.im@icloud.com>" \
      org.opencontainers.image.authors="Felix2yu <yufei.im@icloud.com>"

ENV NODE_ENV production TZ Asia/Shanghai

RUN apt-get update && \
    apt-get -yq install ca-certificates tzdata git --no-install-recommends && \
    rm -rf /var/lib/apt/lists/* && \
    git clone https://github.com/DIYgod/RSSHub && \
    mv RSSHub /app && \
    sed -i 's%javdb.com%javdb38.com%g' /app/lib/v2/javdb/utils.js && \
    rm -rf /app/node_modules /app/npm-debug.log /app/Dockerfile* /app/docker-compose* /app/.dockerignore /app/.gitignore /app/LICENSE /app/.vscode /app/.github /app/assets /app/coverage /app/docs /app/test /app/.codecov.yml /app/.eslint* /app/.prettier* /app/.yarnrc /app/.npmrc /app/.nvmrc /app/*.md /app/process.json /app/app.json /app/.travis.yml
WORKDIR /app
COPY --from=dep-builder /app/app-minimal/node_modules /app/node_modules
COPY --from=dep-builder /usr/bin/dumb-init /usr/bin/dumb-init

EXPOSE 1200
ENTRYPOINT ["dumb-init", "--"]

CMD ["npm", "run", "start"]
