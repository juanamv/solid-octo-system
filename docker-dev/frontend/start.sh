#!/bin/sh
set -eu

checksum=$(sha256sum package-lock.json package.json | sha256sum | cut -d ' ' -f 1)
if [ ! -f node_modules/.sales-dependencies ] || [ "$(cat node_modules/.sales-dependencies)" != "$checksum" ] || [ ! -x node_modules/.bin/ng ]; then
    npm ci --no-audit --no-fund
    printf '%s' "$checksum" > node_modules/.sales-dependencies
fi

exec "$@"
