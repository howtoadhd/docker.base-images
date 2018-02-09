FROM builder:php-cli

ENV WP_CLI_URL https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

ENV COMPOSER_URL https://getcomposer.org/composer.phar
ENV COMPOSER_ALLOW_SUPERUSER 1

# Install build dependencies.
RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ \
		curl \
		git \
	&& curl -L -o /usr/bin/wp "${WP_CLI_URL}" \
    && chmod +x /usr/bin/wp \
	&& curl -L -o /usr/bin/composer "${COMPOSER_URL}" \
    && chmod +x /usr/bin/composer

# Reset docker CMD & Entrypoint
ENTRYPOINT ["/bin/sh", "-c"]
CMD ["/bin/bash"]
