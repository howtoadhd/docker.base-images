FROM alpine:3.7
MAINTAINER Lorelei Aurora <iam@l5i.me>

# 82 is the standard uid/gid for "www-data" in Alpine so we use it for www-data user and app group
# http://git.alpinelinux.org/cgit/aports/tree/main/apache2/apache2.pre-install?h=v3.3.2
# http://git.alpinelinux.org/cgit/aports/tree/main/lighttpd/lighttpd.pre-install?h=v3.3.2
# http://git.alpinelinux.org/cgit/aports/tree/main/nginx-initscripts/nginx-initscripts.pre-install?h=v3.3.2

RUN set -x \
\
    && apk add --no-cache \
        bash \
        less \
    && sed -i 's#/bin/ash#/bin/bash#g' /etc/passwd \
\
	&& addgroup \
	    -g 83 \
	    -S app \
\
	&& adduser \
	    -u 83 \
	    -g app \
        -G app \
        -h /app \
	    -s /sbin/nologin \
        -D -S -H app \
\
	&& adduser \
	    -u 82 \
	    -g www-data \
        -G app \
        -h /app/www \
        -s /sbin/nologin \
        -D -S -H www-data \
\
    # ensure /var/www exists
    && mkdir -p /app/www \
    && chown -R app:app /app \
    && chmod 750 /app \
    && chmod 550 /app/www

WORKDIR /app

CMD ["/bin/bash"]
