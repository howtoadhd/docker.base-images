FROM builder:php-fpm
MAINTAINER Lorelei Aurora <iam@l5i.me>

RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ \
            php7-xdebug \
    && rm -f /etc/php7/conf.d/xdebug.ini

COPY ./fs /
