#!/usr/bin/env bash

sudo docker run -di \
    --restart=always \
    --name=rs \
    -p 16379:6379 \
    -v /var/www/redisearch:/data \
    redislabs/redisearch \
    --loadmodule /usr/lib/redis/modules/redisearch.so TIMEOUT 10000 \
    --appendonly yes \
    --aof-use-rdb-preamble yes \
    --maxmemory-policy volatile-lru
