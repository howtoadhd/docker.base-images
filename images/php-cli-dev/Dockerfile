FROM builder:php-cli
MAINTAINER Lorelei Aurora <iam@l5i.me>

USER root

RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ \
            php7-xdebug \
    && rm -f /etc/php7/conf.d/xdebug.ini

COPY ./fs /

USER app