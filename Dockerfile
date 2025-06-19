FROM php:8.2.4-apache
ARG DEBIAN_FRONTEND=noninteractive
RUN docker-php-ext-install mysqli
RUN apt update \
    && apt install libzip-dev zlib1g-dev -y \
    && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-install zip
RUN docker-php-ext-install pdo_mysql
RUN a2enmod rewrite
