#!/bin/bash

# build php 8.1
cd ./php81
docker buildx build --platform linux/arm64 -t ame1973/swoole-octane:php8.1 . --push

# build php 8.1 alpine
cd ../
cd ./php81-alpine
docker buildx build --platform linux/arm64 -t ame1973/swoole-octane:php8.1-alpine . --push

# build php 8.2
cd ../
cd ./php82
docker buildx build --platform linux/arm64 -t ame1973/swoole-octane:latest -t ame1973/swoole-octane:php8.2 . --push