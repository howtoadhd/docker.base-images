FROM builder:php-base
MAINTAINER Lorelei Aurora <iam@l5i.me>

RUN set -x \
\
    && apk add --no-cache \
        php7-fpm \
    && rm -rf /etc/php7/php-fpm.d \
    && ln -sf /usr/sbin/php-fpm7 /usr/sbin/php-fpm

COPY ./fs /

RUN chown -R root:root /etc/php7 \
    && find /etc/php7 -type d -exec chmod 500 {} \; \
    && find /etc/php7 -type f -exec chmod 400 {} \;

USER root

EXPOSE 9000

ENTRYPOINT ["docker-php-entrypoint"]

CMD ["php-fpm"]
