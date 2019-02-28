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
    richarvey/nginx-php-fpm:1.5.7

# 设置时区
docker exec nginx apk add -U tzdata
docker exec nginx cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

# 安装redis扩展
docker exec -it nginx bash
mkdir -p /usr/src/php/ext/redis 
curl -L https://github.com/phpredis/phpredis/archive/4.2.0.tar.gz | tar xvz -C /usr/src/php/ext/redis --strip 1 
echo 'redis' >> /usr/src/php-available-exts 
docker-php-ext-install redis
