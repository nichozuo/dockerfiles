#!/usr/bin/env bash
# https://hub.docker.com/_/redis/

docker run \
    --detach \
    --name redis \
    --restart=always \
    --publish 6379:6379 \
    redis:4.0.13

docker exec redis cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
