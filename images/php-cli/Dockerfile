FROM builder:php-base
MAINTAINER Lorelei Aurora <iam@l5i.me>

RUN set -x \
\
    && apk add --no-cache \
        php7 \
        php7-phar \
        php7-pcntl

COPY ./fs /

USER root

ENTRYPOINT ["docker-php-entrypoint"]

CMD ["php"]
