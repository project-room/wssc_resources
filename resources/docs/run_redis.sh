#!/usr/bin/env bash

sudo docker run -di \
    -p 16379:6379 \
    -v /var/www/redis/data:/data \
    --restart=always \
    --name=redis \
    redis