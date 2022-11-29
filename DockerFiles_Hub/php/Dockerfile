FROM php:${PHP_VERSION}-fpm-alpine as app_php

ARG STABILITY="stable"
ENV STABILITY ${STABILITY}

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
RUN chmod +x /usr/local/bin/install-php-extensions && \
    install-php-extensions gd xdebug && \
    install-php-extensions @composer

WORKDIR /var/www/symfonyapplication

COPY ./symfonyapplication .

EXPOSE 3001