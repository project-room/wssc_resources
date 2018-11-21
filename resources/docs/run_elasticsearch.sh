#!/usr/bin/env bash

sudo mkdir -p /var/www/es
sudo chown 1000:1000 /var/www/es

sudo docker run -di \
    -p 19200:9200 \
    -p 19300:9300 \
    -e "discovery.type=single-node" \
    -v /var/www/es:/usr/share/elasticsearch/data \
    --restart=always \
    --name=es \
    docker.elastic.co/elasticsearch/elasticsearch:6.4.0