FROM php:8-fpm
RUN apt-get update && apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    wget \
    unzip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install pdo_mysql

RUN wget https://github.com/flarum/installation-packages/raw/main/packages/v1.x/flarum-v1.x-no-public-dir-php8.3.zip
RUN unzip flarum-v1.x-no-public-dir-php8.3.zip
RUN rm flarum-v1.x-no-public-dir-php8.3.zip
RUN chmod -R 777 *

CMD [ "php-fpm" ]