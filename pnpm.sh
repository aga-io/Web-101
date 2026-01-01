#!/bin/bash
# Usage: ./pnpm install or ./pnpm run dev
# docker-compose run --rm -p 5173:5173 -w /var/www/html/app npm "$@"
# ./pnpm run dev -- --host
docker-compose run --rm -p 5173:5173 -w /var/www/html/app npm "$@"