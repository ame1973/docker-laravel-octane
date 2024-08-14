FROM phpswoole/swoole:5.1.3-php8.2

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

RUN docker-php-ext-install mysqli pdo_mysql exif pcntl zip bcmath intl gmp gd

RUN rm -rf /etc/supervisor/service.d/swoole.conf

RUN rm -rf /var/www

WORKDIR /app

CMD []