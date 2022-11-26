ARG NODE_VERSION=19.1.0

FROM node:${NODE_VERSION}-alpine AS node

COPY --from=node /usr/lib /usr/lib
COPY --from=node /usr/local/share /usr/local/share
COPY --from=node /usr/local/lib /usr/local/lib
COPY --from=node /usr/local/include /usr/local/include
COPY --from=node /usr/local/bin /usr/local/bin

WORKDIR /srv/app
RUN apk add --update nodejs npm && \
    apk add --update npm
# RUN npm -v in case you want to see npm version
RUN npm install express
# RUN npm ls in case you want to list packages installed with npm