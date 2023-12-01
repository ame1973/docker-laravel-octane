# docker-laravel-octane

base phpswoole/swoole:php8.2 image

include: php8.2, swoole, composer2, supervisor, cron, nodejs 18, npm, pnpm, mysql, redis, xlswriter

workdir `/app`

```dockerfile
# copy supervisor config
COPY ./Docker/config/supervisor /etc/supervisor/service.d

# laravel schedule cronjob
RUN echo "* * * * * cd /app && php artisan schedule:run >> /dev/null 2>&1" >> /var/spool/cron/crontabs/root
```

## Build

```shell
docker buildx build --platform linux/arm64 -t ame1973/swoole-octane:latest -t ame1973/swoole-octane:php8.2 . --push
```
