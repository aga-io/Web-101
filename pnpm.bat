@echo off
docker-compose run --rm -p 5173:5173 -w /var/www/html/app npm %*