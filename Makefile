SHELL := /bin/bash
.DEFAULT_GOAL:= help

help: ## Print this message.
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

all: prepare-env alpine php-base php-cli php-cli-dev php-fpm php-fpm-dev nginx app-builder ## Run all builds and tests.


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

nginx: nginx-build nginx-test ## Build and test the Nginx image.

nginx-build: ## Build the Nginx image.
	$(call build_image,nginx)

nginx-test: ## Test the Nginx image.
	$(call test_image,nginx,-e ROOT_DOMAIN=localhost -e FASTCGI_PASS=127.0.0.1:9000)


##########################################    PHP Base   ##########################################

php-base: php-base-build ## Build the PHP Base image.

php-base-build: ## Build the PHP Base image.
	$(call build_image,php-base)


##########################################    PHP CLI    ##########################################

php-cli: php-cli-build php-cli-test ## Build and test the PHP CLI image.

php-cli-build: ## Build the PHP CLI image.
	$(call build_image,php-cli)

php-cli-test: ## Test the PHP CLI image.
	$(call test_image,php-cli)


########################################    PHP CLI DEV    ########################################

php-cli-dev: php-cli-dev-build php-cli-dev-test ## Build and test the PHP CLI dev image.

php-cli-dev-build: ## Build the PHP CLI dev image.
	$(call build_image,php-cli-dev)

php-cli-dev-test: ## Test the PHP CLI dev image.
	$(call test_image,php-cli-dev)


##########################################    PHP FPM    ##########################################

php-fpm: php-fpm-build php-fpm-test ## Build and test the PHP FPM image.

php-fpm-build: ## Build the PHP FPM image.
	$(call build_image,php-fpm)

php-fpm-test: ## Test the PHP FPM image.
	$(call test_image,php-fpm)


########################################    PHP FPM DEV    ########################################

php-fpm-dev: php-fpm-dev-build php-fpm-dev-test ## Build and test the PHP FPM image.

php-fpm-dev-build: ## Build the PHP FPM dev image.
	$(call build_image,php-fpm-dev)

php-fpm-dev-test: ## Test the PHP FPM dev image.
	$(call test_image,php-fpm-dev)


########################################    App Builder    ########################################

app-builder: app-builder-build app-builder-test ## Build and test the App Builder image.

app-builder-build: ## Build the PHP FPM dev image.
	$(call build_image,app-builder)

app-builder-test: ## Test the PHP FPM dev image.
	$(call test_image,app-builder)





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
	docker tag builder:alpine ${TEMP_IMAGE_ALPINE}
	docker push ${TEMP_IMAGE_ALPINE}

_travis-alpine-pull:
	docker pull ${TEMP_IMAGE_ALPINE}
	docker tag ${TEMP_IMAGE_ALPINE} builder:alpine


##########################################     Nginx     ##########################################

export TEMP_IMAGE_NGINX="${TEMP_IMAGE_BASE}__nginx"

travis-nginx-before_script: _tests-install _travis-alpine-pull

travis-nginx-script: nginx-build nginx-test

travis-nginx-after_success:
	docker tag builder:nginx ${TEMP_IMAGE_NGINX}
	docker push ${TEMP_IMAGE_NGINX}

_travis-nginx-pull:
	docker pull ${TEMP_IMAGE_NGINX}
	docker tag ${TEMP_IMAGE_NGINX} builder:nginx


##########################################    PHP Base   ##########################################

export TEMP_IMAGE_PHP_BASE="${TEMP_IMAGE_BASE}__php-base"

travis-php-base-before_script: _travis-alpine-pull

travis-php-base-script: php-base-build

travis-php-base-after_success:
	docker tag builder:php-base ${TEMP_IMAGE_PHP_BASE}
	docker push ${TEMP_IMAGE_PHP_BASE}

_travis-php-base-pull:
	docker pull ${TEMP_IMAGE_PHP_BASE}
	docker tag ${TEMP_IMAGE_PHP_BASE} builder:php-base


##########################################    PHP CLI    ##########################################

export TEMP_IMAGE_PHP_CLI="${TEMP_IMAGE_BASE}__php-cli"

travis-php-cli-before_script: _tests-install _travis-php-base-pull

travis-php-cli-script: php-cli-build php-cli-test

travis-php-cli-after_success:
	docker tag builder:php-cli ${TEMP_IMAGE_PHP_CLI}
	docker push ${TEMP_IMAGE_PHP_CLI}

_travis-php-cli-pull:
	docker pull ${TEMP_IMAGE_PHP_CLI}
	docker tag ${TEMP_IMAGE_PHP_CLI} builder:php-cli


########################################    PHP CLI DEV    ########################################

export TEMP_IMAGE_PHP_CLI_DEV="${TEMP_IMAGE_BASE}__php-cli-dev"

travis-php-cli-dev-before_script: _tests-install _travis-php-cli-pull

travis-php-cli-dev-script: php-cli-dev-build php-cli-dev-test

travis-php-cli-dev-after_success:
	docker tag builder:php-cli-dev ${TEMP_IMAGE_PHP_CLI_DEV}
	docker push ${TEMP_IMAGE_PHP_CLI_DEV}

_travis-php-cli-dev-pull:
	docker pull ${TEMP_IMAGE_PHP_CLI_DEV}
	docker tag ${TEMP_IMAGE_PHP_CLI_DEV} builder:php-cli-dev


##########################################    PHP FPM    ##########################################

export TEMP_IMAGE_PHP_FPM="${TEMP_IMAGE_BASE}__php-fpm"

travis-php-fpm-before_script: _tests-install _travis-php-base-pull

travis-php-fpm-script: php-fpm-build php-fpm-test

travis-php-fpm-after_success:
	docker tag builder:php-fpm ${TEMP_IMAGE_PHP_FPM}
	docker push ${TEMP_IMAGE_PHP_FPM}

_travis-php-fpm-pull:
	docker pull ${TEMP_IMAGE_PHP_FPM}
	docker tag ${TEMP_IMAGE_PHP_FPM} builder:php-fpm


########################################    PHP FPM DEV    ########################################

export TEMP_IMAGE_PHP_FPM_DEV="${TEMP_IMAGE_BASE}__php-fpm-dev"

travis-php-fpm-dev-before_script: _tests-install _travis-php-fpm-pull

travis-php-fpm-dev-script: php-fpm-dev-build php-fpm-dev-test

travis-php-fpm-dev-after_success:
	docker tag builder:php-fpm-dev ${TEMP_IMAGE_PHP_FPM_DEV}
	docker push ${TEMP_IMAGE_PHP_FPM_DEV}

_travis-php-fpm-dev-pull:
	docker pull ${TEMP_IMAGE_PHP_FPM_DEV}
	docker tag ${TEMP_IMAGE_PHP_FPM_DEV} builder:php-fpm-dev


########################################    App Builder    ########################################

export TEMP_IMAGE_APP_BUILDER="${TEMP_IMAGE_BASE}__app-builder"

travis-app-builder-before_script: _tests-install _travis-php-cli-pull

travis-app-builder-script: app-builder-build app-builder-test

travis-app-builder-after_success:
	docker tag builder:app-builder ${TEMP_IMAGE_APP_BUILDER}
	docker push ${TEMP_IMAGE_APP_BUILDER}

_travis-app-builder-pull:
	docker pull ${TEMP_IMAGE_APP_BUILDER}
	docker tag ${TEMP_IMAGE_APP_BUILDER} builder:app-builder


##########################################    Promote    ##########################################

travis-promote-before_script: _travis-${SERVICE}-pull

travis-promote-script:
	if [ $$TRAVIS_PULL_REQUEST == 'false' ]; then \
		docker tag builder:${SERVICE} howtoadhd/base-images:$${TRAVIS_BRANCH//\//__}-${SERVICE}; \
		docker push howtoadhd/base-images:$${TRAVIS_BRANCH//\//__}-${SERVICE}; \
	fi
	if [ $$TRAVIS_PULL_REQUEST == 'false' ] && [ $$TRAVIS_BRANCH == 'master' ]; then \
		docker tag builder:${SERVICE} howtoadhd/base-images:latest-${SERVICE}; \
		docker push howtoadhd/base-images:latest-${SERVICE}; \
	fi
