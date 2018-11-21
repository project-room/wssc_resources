#!/usr/bin/env bash

sudo docker run -itd \
    --name=wssc_b \
    --restart=always \
    -p 6079:7079 \
    -p 6089:7089 \
    -p 6099:7099 \
    -p 7009:8009 \
    -e SERVER_ENV_MODE=dev \
    -e SERVER_ENV_APP_IP=119.23.146.211 \
    -e SERVER_ENV_APP_PORT=7009 \
    -e SERVER_ENV_DB_HOST=119.23.146.211 \
    -e SERVER_ENV_DB_PORT=13306 \
    -e SERVER_ENV_DB_NAME=wssc_b \
    -e SERVER_ENV_DB_PASS=root \
    -e SERVER_ENV_DB_USER=root \
    -e SERVER_ENV_LOCAL_HOST=119.23.146.211:7009 \
    -e SERVER_ENV_ONLY_OFFICE_HOST=119.23.146.211:8019 \
    -e SERVER_ENV_MINIO_HOST=119.23.146.211:8029 \
    -e SERVER_ENV_REDIS_HOST=119.23.146.211:16379 \
    -e SERVER_ENV_DOSSIER_HOST=59.173.30.166:9077 \
    -v /var/www/project/b/data:/var/www/project/data \
    176.122.188.100:16000/wssc-master:latest
