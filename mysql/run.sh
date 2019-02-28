#!/usr/bin/env bash
# https://hub.docker.com/_/mysql/

mkdir -p /soft/mysql

docker run \
    --detach \
    --name mysql \
    --restart=always \
    --publish 3306:3306 \
    --volume /soft/mysql:/var/lib/mysql \
    --env MYSQL_ROOT_PASSWORD=Nihao123 \
    mysql:5.7.25

docker exec mysql cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
