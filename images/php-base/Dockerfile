FROM builder:alpine
MAINTAINER Lorelei Aurora <iam@l5i.me>

RUN set -x \
\
    && apk add --no-cache \
        php7-common \
        php7-ctype \
        php7-curl \
        php7-dom \
        php7-exif \
        php7-fileinfo \
        php7-gd \
        php7-gettext \
        php7-iconv \
        php7-intl \
        php7-json \
        php7-mbstring \
        php7-mcrypt \
        php7-memcached \
        php7-mysqli \
        php7-mysqlnd \
        php7-opcache \
        php7-openssl \
        php7-pdo \
        php7-pdo_mysql \
        php7-posix \
        php7-session \
        php7-simplexml \
        php7-tokenizer \
        php7-xml \
        php7-xmlreader \
        php7-xmlwriter \
        php7-zip \
        php7-zlib \
\
    && apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ --repository http://dl-cdn.alpinelinux.org/alpine/edge/main/ \
        php7-libsodium \
    && echo 'extension=sodium.so' > /etc/php7/conf.d/50_libsodium.ini

COPY ./fs /
