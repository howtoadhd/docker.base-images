FROM builder:alpine
MAINTAINER Lorelei Aurora <iam@l5i.me>

RUN set -x \
\
    && apk add --no-cache \
        nginx \
    && rm -rf /etc/nginx

COPY ./fs /

RUN chown -R root:root /etc/nginx \
    && find /etc/nginx -type d -exec chmod 500 {} \; \
    && find /etc/nginx -type f -exec chmod 400 {} \; \
\
    && chown -R app:app /app \
    && chmod 750 /app \
\
    && find /app/error_pages -type d -exec chmod 550 {} \; \
    && find /app/error_pages -type f -exec chmod 440 {} \; \
\
    && find /app/www -type d -exec chmod 550 {} \; \
    && find /app/www -type f -exec chmod 440 {} \;


USER root

EXPOSE 80

ENTRYPOINT ["docker-nginx-entrypoint"]

CMD ["nginx"]
