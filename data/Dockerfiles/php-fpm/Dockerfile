FROM php:7.1-fpm
MAINTAINER Andre Peters <andre.peters@servercow.de>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
        && apt-get install -y zlib1g-dev libicu-dev g++ libidn11-dev libxml2-dev

RUN docker-php-ext-configure intl
RUN docker-php-ext-install intl pdo pdo_mysql xmlrpc

COPY ./docker-entrypoint.sh /

EXPOSE 9000

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["php-fpm"]
