#!/bin/bash
docker-compose exec php_fpm php /var/www/html/app/artisan "$@"