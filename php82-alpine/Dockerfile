FROM phpswoole/swoole:5.1.1-php8.2-alpine

RUN apk update

# install extensions
RUN apk add libintl icu icu-dev libxml2-dev libzip-dev \
    && docker-php-ext-install intl zip \
    && apk add postgresql-dev \
    && docker-php-ext-install mysqli pdo pdo_mysql pcntl \
    && apk add freetype-dev \
        libjpeg-turbo-dev \
    && docker-php-ext-install gd \
    && apk add gmp gmp-dev \
    && docker-php-ext-install gmp \
    && apk add git \
        dcron \
        nano \
    && apk add autoconf g++ imagemagick-dev libtool make pcre-dev \
    && pecl install imagick \
    && docker-php-ext-enable imagick \
    && apk del autoconf g++ libtool make pcre-dev \
    && docker-php-ext-install bcmath \
    && apk add libsodium-dev \
    && docker-php-ext-install sodium \
    && apk add mysql-client \
        unzip \
    && apk cache clean

RUN rm -rf /etc/supervisor/service.d/swoole.conf

RUN rm -rf /var/www

WORKDIR /app

CMD []