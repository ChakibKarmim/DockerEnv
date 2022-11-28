ARG NODE_VERSION=19.1.0
ARG PHP_VERSION=8.1

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

# **************************************************************************

FROM php:${PHP_VERSION}-fpm-alpine as app_php

ARG STABILITY="stable"
ENV STABILITY ${STABILITY}

WORKDIR /srv/app

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
RUN chmod +x /usr/local/bin/install-php-extensions && \
    install-php-extensions gd xdebug && \
    install-php-extensions @composer


FROM app_node as app_react

WORKDIR /srv/app

ENV PATH /app/node_modules/.bin:$PATH

CMD ["npm", "start"]