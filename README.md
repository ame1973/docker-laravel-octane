# docker-laravel-octane

A Docker image for Laravel Octane applications based on phpswoole/swoole image.

[![Docker Hub](https://img.shields.io/docker/pulls/ame1973/swoole-octane.svg)](https://hub.docker.com/r/ame1973/swoole-octane)

🔗 [Docker Hub Repository](https://hub.docker.com/r/ame1973/swoole-octane)

## Supported tags and respective Dockerfile links

- [`php8.4`](https://github.com/ame1973/docker-laravel-octane/blob/main/php84/Dockerfile)
- [`php8.3`](https://github.com/ame1973/docker-laravel-octane/blob/main/php83/Dockerfile)
- [`php8.2`](https://github.com/ame1973/docker-laravel-octane/blob/main/php82/Dockerfile), [`php8.2-alpine`](https://github.com/ame1973/docker-laravel-octane/blob/main/php82-alpine/Dockerfile)
- [`php8.1`](https://github.com/ame1973/docker-laravel-octane/blob/main/php81/Dockerfile), [`php8.1-alpine`](https://github.com/ame1973/docker-laravel-octane/blob/main/php81-alpine/Dockerfile)

All images support `linux/arm64` platform.

## Features

- Two variants available:
  - Standard version: Based on Ubuntu
  - Alpine version: Lightweight, based on Alpine Linux
- Multiple PHP versions support: 8.1, 8.2, 8.3, 8.4
- Pre-installed packages:
  - Swoole
  - Composer 2
  - Supervisor
  - Cron
  - NPM
  - PNPM
  - MySQL client
  - Redis client
- Configured with Laravel Schedule
- Working directory set to `/app`

## Quick Start

### Pull the Image

Standard version:
```bash
docker pull ame1973/swoole-octane:php8.3
```

Alpine version:
```bash
docker pull ame1973/swoole-octane:php8.3-alpine
```

### Basic Usage

Standard version:
```bash
docker run -d \
  --name laravel-app \
  -v $(pwd):/app \
  -p 8000:8000 \
  ame1973/swoole-octane:php8.3
```

Alpine version:
```bash
docker run -d \
  --name laravel-app \
  -v $(pwd):/app \
  -p 8000:8000 \
  ame1973/swoole-octane:php8.3-alpine
```

## Image Variants

- `php8.x`: Standard version based on Ubuntu
- `php8.x-alpine`: Lightweight version based on Alpine Linux (available for PHP 8.1 and 8.2)

## Available Tags

- `php8.1` - PHP 8.1
- `php8.2` - PHP 8.2
- `php8.3` - PHP 8.3
- `php8.4` - PHP 8.4 (when available)

## Pre-configured Features

### Supervisor

Supervisor configuration files are automatically copied to `/etc/supervisor/service.d`

### Cron Jobs

Laravel scheduler is configured to run every minute:
```bash
* * * * * cd /app && php artisan schedule:run >> /dev/null 2>&1
```

## Building the Image

### Using build script

```bash
./build.sh
```

### Manual build

```bash
cd php83
docker buildx build --platform linux/arm64 -t ame1973/swoole-octane:php8.3 . --push
```

## Development

The working directory is set to `/app`, where your Laravel application should be mounted.

## License

MIT License

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

```dockerfile
# copy supervisor config
COPY ./Docker/config/supervisor /etc/supervisor/service.d

# laravel schedule cronjob
RUN echo "* * * * * cd /app && php artisan schedule:run >> /dev/null 2>&1" >> /var/spool/cron/crontabs/root
```
