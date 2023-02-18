FROM php:8.0-alpine3.16

RUN apk add --no-cache rabbitmq-c-dev \
	&& apk add --no-cache --virtual .build-deps $PHPIZE_DEPS \
	&& docker-php-source extract \
	&& pecl install amqp \
	&& pecl install apcu-5.1.18 \
	&& pecl install redis \
	&& pecl install igbinary \
	&& pecl install xdebug-3.1.6 \
	&& pecl clear-cache \
	&& docker-php-ext-install pdo_mysql \
	&& docker-php-source delete \
	&& docker-php-ext-enable amqp apcu opcache pdo_mysql redis igbinary xdebug \
	&& apk del .build-deps

ENTRYPOINT ["php"]