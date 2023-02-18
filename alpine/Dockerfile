FROM alpine:3.16

RUN apk add --no-cache php8 \
		# this modules I need
		php8-curl php8-mbstring php8-pdo php8-pdo_mysql php8-mysqlnd php8-opcache php8-openssl \
		php8-pecl-xdebug php8-pecl-redis php8-pecl-amqp php8-pecl-apcu \
		# this modules is common, let it be
		php8-ctype php8-dom php8-fileinfo php8-phar php8-posix \
		php8-simplexml php8-tokenizer php8-xml php8-xmlreader php8-xmlwriter  \
		# this modules I don't need, but they enabled by default in php:8.0-alpine container
		php8-ftp php8-iconv php8-sodium php8-sqlite3 php8-pdo_sqlite \
	&& echo -e "zend_extension=xdebug.so\nxdebug.mode=debug" > /etc/php8/conf.d/99_custom.ini

ENTRYPOINT ["php"]