@echo off
docker-compose run --rm --service-ports -w /var/www/html/app npm %*