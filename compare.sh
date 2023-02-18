#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NOCOLOR='\033[0m'

TOOL_DIR="$(dirname "$0")"

ALPINE_START=$SECONDS
docker build --no-cache -t dockertest:alpine $TOOL_DIR/alpine
ALPINE_END=$SECONDS

PHP_START=$SECONDS
docker build --no-cache -t dockertest:php    $TOOL_DIR/php
PHP_END=$SECONDS

docker run --rm -it dockertest:alpine -m > $TOOL_DIR/alpine/modules
docker run --rm -it dockertest:php -m    > $TOOL_DIR/php/modules

echo -e "\n==============\n"

diff -u $TOOL_DIR/alpine/modules $TOOL_DIR/php/modules \
	&& echo -e "${GREEN}Modules are the same!${NOCOLOR}" \
	|| echo -e "${RED}Modules are different!!!${NOCOLOR}"

rm $TOOL_DIR/alpine/modules $TOOL_DIR/php/modules

echo

echo -e "alpine:3.16 based build time: ${GREEN}$((ALPINE_END-ALPINE_START)) seconds${NOCOLOR}"
echo -e "php:8.0-alpine3.16 based build time: ${RED}$((PHP_END-PHP_START)) seconds${NOCOLOR}"

echo

echo -e "alpine:3.16 based image size: ${GREEN}$(docker images --format '{{.Size}}' dockertest:alpine)${NOCOLOR}"
echo -e "php:8.0-alpine3.16 based image size: ${RED}$(docker images --format '{{.Size}}' dockertest:php)${NOCOLOR}"

echo