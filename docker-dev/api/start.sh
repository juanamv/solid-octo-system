#!/bin/sh
set -eu

mkdir -p storage/app/public storage/framework/cache/data storage/framework/sessions storage/framework/views storage/logs bootstrap/cache
composer install --prefer-dist --no-interaction --no-progress
php artisan config:clear
php artisan migrate --force
php /usr/local/lib/sales/seed.php

exec "$@"
