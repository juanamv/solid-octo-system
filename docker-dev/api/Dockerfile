FROM php:8.3-cli-bookworm

RUN apt-get update \
    && apt-get install -y --no-install-recommends git unzip libonig-dev libzip-dev libicu-dev libxml2-dev \
    && docker-php-ext-install -j2 pdo_mysql mbstring bcmath pcntl zip intl dom xml xmlwriter \
    && rm -rf /var/lib/apt/lists/*

COPY --from=composer:2 /usr/bin/composer /usr/local/bin/composer
COPY start.sh seed.php /usr/local/lib/sales/
RUN sed -i 's/\r$//' /usr/local/lib/sales/start.sh
WORKDIR /app
EXPOSE 8000
ENTRYPOINT ["sh", "/usr/local/lib/sales/start.sh"]
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]
