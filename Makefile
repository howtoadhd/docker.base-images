.DEFAULT_GOAL:= help

help: ## Print this message.
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ':.*?## '}; {printf '\033[36m%-30s\033[0m %s\n', $$1, $$2}'

all: alpine php-cli php-fpm nginx ## Run all builds and tests.


##########################################  Environment  ##########################################

prepare-env: _tests-install _base-pull  ## Setup prerequisites.

_tests-install:
	bundle install --jobs=3 --retry=3 --deployment

_base-pull:
	docker pull alpine:3.7


##########################################    Alpine     ##########################################

alpine: alpine-build alpine-test ## Build and test the Alpine image.

alpine-build: ## Build the Alpine image.
	$(call build_image,alpine)

alpine-test: ## Test the Alpine image.
	$(call test_image,alpine)


##########################################     Nginx     ##########################################

nginx: nginx-build nginx-test ## Build and test the Alpine image.

nginx-build: ## Build the Nginx image.
	$(call build_image,nginx)

nginx-test: ## Test the Nginx image.
	$(call test_image,nginx,-e ROOT_DOMAIN=localhost -e FASTCGI_PASS=127.0.0.1:9000)


##########################################    PHP Base   ##########################################

_php-base-build:
	$(call build_image,php-base)


##########################################    PHP CLI    ##########################################

php-cli: php-cli-build php-cli-test ## Build and test the Alpine image.

php-cli-build: _php-base-build ## Build the PHP CLI image.
	$(call build_image,php-cli)

php-cli-test: ## Test the PHP CLI image.
	$(call test_image,php-cli)


##########################################    PHP FPM    ##########################################

php-fpm: php-fpm-build php-fpm-test ## Build and test the Alpine image.

php-fpm-build: _php-base-build ## Build the PHP FPM image.
	$(call build_image,php-fpm)

php-fpm-test: ## Test the PHP FPM image.
	$(call test_image,php-fpm)





##########################################   Functions   ##########################################

NOW=$(shell date +'%s')

define build_image
	docker build --no-cache -t "builder:${1}" "images/${1}"
endef

define test_image
	set -x; \
	export TEST_CONTAINER="builder-${1}_${NOW}"; \
	export TEST_CONTAINER_ARGS="${2}"; \
	docker run --name="$${TEST_CONTAINER}" -d -i -t $${TEST_CONTAINER_ARGS} "builder:${1}" || exit 1; \
	bundle exec rspec "spec/${1}"; TEST_EC=$${?}; \
	docker kill $${TEST_CONTAINER}; \
	docker rm -f $${TEST_CONTAINER} || exit 1; \
	exit $${TEST_EC}
endef





##########################################   Travis CI   ##########################################

TRAVIS_COMMIT?='local'
TEMP_IMAGE_REPO?='howtoadhd/travis-dump'
TEMP_IMAGE_TAG_BASE?='howtoadhd_base-images'

TEMP_IMAGE_BASE="${TEMP_IMAGE_REPO}:${TEMP_IMAGE_TAG_BASE}__${TRAVIS_COMMIT}"


##########################################    Alpine     ##########################################

export TEMP_IMAGE_ALPINE="${TEMP_IMAGE_BASE}__alpine"

travis-alpine-before_script: _tests-install _base-pull

travis-alpine-script: alpine-build alpine-test

travis-alpine-after_success:
	docker tag builder:alpine "${TEMP_IMAGE_ALPINE}"
	docker push "${TEMP_IMAGE_ALPINE}"

_travis-alpine-pull:
	docker pull "${TEMP_IMAGE_ALPINE}"
	docket tag "${TEMP_IMAGE_ALPINE}" builder:alpine


##########################################     Nginx     ##########################################

export TEMP_IMAGE_NGINX="${TEMP_IMAGE_BASE}__nginx"

travis-nginx-before_script: _tests-install _travis-alpine-pull

travis-nginx-script: nginx-build nginx-test

travis-nginx-after_success:
	docker tag builder:nginx "${TEMP_IMAGE_NGINX}"
	docker push "${TEMP_IMAGE_NGINX}"

_travis-nginx-pull:
	docker pull "${TEMP_IMAGE_NGINX}"
	docket tag "${TEMP_IMAGE_NGINX}" builder:nginx


##########################################    PHP CLI    ##########################################

export TEMP_IMAGE_PHP_CLI="${TEMP_IMAGE_BASE}__php-cli"

travis-php-cli-before_script: _tests-install _travis-alpine-pull

travis-php-cli-script: php-cli-build php-cli-test

travis-php-cli-after_success:
	docker tag builder:php-cli "${TEMP_IMAGE_PHP_CLI}"
	docker push "${TEMP_IMAGE_PHP_CLI}"

_travis-php-cli-pull:
	docker pull "${TEMP_IMAGE_PHP_CLI}"
	docket tag "${TEMP_IMAGE_PHP_CLI}" builder:php-cli


##########################################    PHP FPM    ##########################################

export TEMP_IMAGE_PHP_FPM="${TEMP_IMAGE_BASE}__php-fpm"

travis-php-fpm-before_script: _tests-install _travis-alpine-pull

travis-php-fpm-script: php-fpm-build php-fpm-test

travis-php-fpm-after_success:
	docker tag builder:php-fpm "${TEMP_IMAGE_PHP_FPM}"
	docker push "${TEMP_IMAGE_PHP_FPM}"

_travis-php-fpm-pull:
	docker pull "${TEMP_IMAGE_PHP_FPM}"
	docket tag "${TEMP_IMAGE_PHP_FPM}" builder:php-fpm


##########################################    Promote    ##########################################

travis-promote-before_script: _travis-alpine-pull _travis-php-cli-pull _travis-php-fpm-pull _travis-nginx-pull

travis-promote-script:
	if [ "$TRAVIS_PULL_REQUEST" == 'false' ]; then \
		docker tag "builder:${SERVICE}" "howtoadhd/base-images:${TRAVIS_BRANCH}-${SERVICE}"; \
		docker push "howtoadhd/base-images:${TRAVIS_BRANCH}-${SERVICE}"; \
	fi
	if [ "$TRAVIS_PULL_REQUEST" == 'false' ] && [ "$TRAVIS_BRANCH" == 'master' ]; then \
		docker tag "builder:${SERVICE}" "howtoadhd/base-images:latest-${SERVICE}"; \
		docker push "howtoadhd/base-images:latest-${SERVICE}"; \
	fi
