# docker-laravel-octane

base phpswoole/swoole image

include: swoole, composer2, supervisor, cron, nodejs 18, npm, pnpm, mysql, redis

php version： 8.1, 8.2, 8.3 

workdir `/app`

```dockerfile
# copy supervisor config
COPY ./Docker/config/supervisor /etc/supervisor/service.d

# laravel schedule cronjob
RUN echo "* * * * * cd /app && php artisan schedule:run >> /dev/null 2>&1" >> /var/spool/cron/crontabs/root
```

## Build

```shell
./build.sh
```

or

```shell
cd php8.2

docker buildx build --platform linux/arm64 -t ame1973/swoole-octane:php8.2 . --push
```

