ARG PHP_VERSION=8.1
FROM php:${PHP_VERSION}-fpm-alpine

ARG STABILITY="stable"
ENV STABILITY ${STABILITY}

WORKDIR /srv/app

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
RUN chmod +x /usr/local/bin/install-php-extensions && \ 
    install-php-extensions gd xdebug && \
    install-php-extensions @composer

