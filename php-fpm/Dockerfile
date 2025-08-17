FROM php:8.4-fpm-alpine

# Override default php-fpm www.conf
ADD ./www.conf /usr/local/etc/php-fpm.d/www.conf

# Override default php.ini
ADD ./php.ini /usr/local/etc/php/php.ini

RUN apk add --no-cache freetds \
    freetds-dev \
    postgresql-dev \
    && docker-php-ext-install bcmath \
    pdo_mysql \
    pdo_dblib \
    pdo_pgsql \
    pgsql

# Create /varr/www/html directory
RUN mkdir -p /var/www/html && chown www-data:www-data /var/www/html
