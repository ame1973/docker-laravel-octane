FROM phpswoole/swoole:5.1.7-php8.3

RUN apt-get update && \
    apt-get upgrade -y && \
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
        unzip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-install mysqli pdo_mysql exif pcntl zip bcmath intl gmp gd

COPY ./rootfilesystem/ /

RUN rm -rf /etc/supervisor/service.d/swoole.conf

RUN rm -rf /var/www

WORKDIR /app

CMD []