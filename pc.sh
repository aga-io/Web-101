#!/bin/bash
# Usage: ./pc require vendor/package
docker-compose run --rm -w /var/www/html/app composer "$@"