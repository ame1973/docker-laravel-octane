FROM phpswoole/swoole:php8.1

COPY ./rootfilesystem/ /

RUN apt-get update && \
    apt-get install -y --force-yes --no-install-recommends \
        libonig-dev \
        libmemcached-dev \
        libz-dev \
        libzip-dev \
        libpq-dev \
        libjpeg-dev \
        libpng-dev \
        libfreetype6-dev \
        libssl-dev \
        openssh-server \
        libmagickwand-dev \
        git \
        cron \
        nano \
        libxml2-dev \
        libreadline-dev \
        libgmp-dev \
        #mariadb-client \
        default-mysql-client \
        unzip

# Install nodejs 18.x
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash -
RUN apt-get install -y nodejs

RUN npm install -g pnpm

RUN docker-php-ext-install mysqli pdo_mysql exif pcntl zip bcmath intl gmp

RUN rm -rf /etc/supervisor/service.d/swoole.conf

RUN rm -rf /var/www

WORKDIR /app
