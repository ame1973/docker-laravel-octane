FROM phpswoole/swoole:5.1.1-php8.1-alpine

RUN apk update

RUN docker-php-ext-install exif pcntl

# install extensions
# intl, zip, soap
RUN apk add libintl icu icu-dev libxml2-dev libzip-dev \
    && docker-php-ext-install intl zip soap

# mysqli, pdo, pdo_mysql, pdo_pgsql
RUN apk add postgresql-dev \
    && docker-php-ext-install mysqli pdo pdo_mysql

# gd
RUN apk add freetype-dev \
        libjpeg-turbo-dev \
    && docker-php-ext-install gd

# gmp
RUN apk add gmp gmp-dev \
    && docker-php-ext-install gmp

# git client
RUN apk add git

# imagick
RUN apk add autoconf g++ imagemagick-dev libtool make pcre-dev \
    && pecl install imagick \
    && docker-php-ext-enable imagick \
    && apk del autoconf g++ libtool make pcre-dev

# install bcmath extension
RUN docker-php-ext-install bcmath

# install sodium
RUN apk add libsodium-dev \
    && docker-php-ext-install sodium

RUN apk add nano \
    mysql-client \
    unzip

RUN apk cache clean

RUN rm -rf /etc/supervisor/service.d/swoole.conf

RUN rm -rf /var/www

WORKDIR /app

CMD []