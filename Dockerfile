FROM php:8.2-fpm

RUN apt-get update && apt-get install -y libpq-dev libicu-dev \
    && docker-php-ext-configure pgsql --with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install pdo pdo_pgsql intl \
    && echo 'extension=intl.so' > /usr/local/etc/php/conf.d/docker-php-ext-intl.ini

COPY . /var/www/html

WORKDIR /var/www/html
