ARG NODE_VERSION=19.1.0

FROM node:${NODE_VERSION}-alpine AS app_node

COPY --from=node /usr/lib /usr/lib
COPY --from=node /usr/local/share /usr/local/share
COPY --from=node /usr/local/lib /usr/local/lib
COPY --from=node /usr/local/include /usr/local/include
COPY --from=node /usr/local/bin /usr/local/bin

WORKDIR /srv/app

RUN apk add --update nodejs npm && \
    apk add --update npm

COPY package.json package-lock.json ./
COPY . .
RUN npm install

CMD ["node", "server.js"]