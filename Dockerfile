FROM php:7.1-cli-alpine

RUN docker-php-ext-install -j$(nproc) mbstring iconv bcmath

#PHP database extensions database (mysql)
RUN docker-php-ext-install -j$(nproc) mysqli pdo pdo_mysql

#PHP Zip extensions and zip
RUN apk add --no-cache unzip zlib-dev libzip-dev \
 && docker-php-ext-configure zip --with-libzip \
 && docker-php-ext-install zip

#PHP soap support: 
RUN apk add --no-cache libxml2-dev && docker-php-ext-install -j$(nproc) soap

#xdebug
RUN apk add --no-cache autoconf $PHPIZE_DEPS && pecl install xdebug-2.6.0 && docker-php-ext-enable xdebug

# php gd support: libjpeg62-turbo-dev libpng12-dev gd
RUN apk add --no-cache freetype libpng libjpeg-turbo freetype-dev libpng-dev libjpeg-turbo-dev && \
  docker-php-ext-configure gd \
    --with-gd \
    --with-freetype-dir=/usr/include/ \
    --with-png-dir=/usr/include/ \
    --with-jpeg-dir=/usr/include/ && \
  NPROC=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1) && \
  docker-php-ext-install -j${NPROC} gd && \
  apk del --no-cache freetype-dev libpng-dev libjpeg-turbo-dev

# Install Composer 
ENV COMPOSER_VERSION master
ENV COMPOSER_ALLOW_SUPERUSER 1
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /app
