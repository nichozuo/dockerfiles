#!/usr/bin/env bash
# https://hub.docker.com/r/richarvey/nginx-php-fpm

# 创建目录
mkdir -p /soft/nginx/sites
mkdir -p /soft/nginx/logs
mkdir -p /soft/nginx/confs

# 启动容器
docker run \
    --detach \
    --name nginx \
    --restart=always \
    --net host \
    -e 'HIDE_NGINX_HEADERS=1' \
    -e 'SKIP_COMPOSER=1' \
    -e "REAL_IP_HEADER=1" \
    -e 'PHP_ERRORS_STDERR=1' \
    --volume /soft/nginx/sites:/var/www/html/sites \
    --volume /soft/nginx/logs:/var/www/html/logs \
    --volume /soft/nginx/confs:/etc/nginx/sites-enabled \
    nichozuo/nginx-php:1.5.7

# 设置时区
docker cp /usr/share/zoneinfo/Asia/Shanghai nginx:/etc/localtime
