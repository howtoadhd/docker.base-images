FROM builder:php-base
MAINTAINER Lorelei Aurora <iam@l5i.me>

RUN set -x \
\
    && apk add --no-cache \
        php7 \
        php7-phar

COPY ./fs /

USER app

EXPOSE 9000

ENTRYPOINT ["docker-php-entrypoint"]

CMD ["php"]
