FROM php:8.3-fpm-alpine

# Override default php-fpm www.conf
ADD ./www.conf /usr/local/etc/php-fpm.d/www.conf

# Override default php.ini
ADD ./php.ini /usr/local/etc/php/php.ini

# Install PHP extensions and Xdebug
RUN apk add --no-cache freetds libpq \
    && apk add --no-cache --virtual .build-deps \
    $PHPIZE_DEPS \
    freetds-dev \
    postgresql-dev \
    linux-headers \
    && pecl install xdebug \
    && docker-php-ext-install bcmath \
    pdo_mysql \
    pdo_dblib \
    pdo_pgsql \
    pgsql \
    && docker-php-ext-enable xdebug \
    && apk del .build-deps

# Add Xdebug configuration
# This tells Xdebug to enable debugging and connect back to the host machine.
RUN echo "xdebug.mode=debug" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.start_with_request=yes" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.client_host=host.docker.internal" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

# Create /varr/www/html directory
RUN mkdir -p /var/www/html && chown www-data:www-data /var/www/html
