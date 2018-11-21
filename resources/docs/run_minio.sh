#!/usr/bin/env bash
sudo docker run -di \
    -p 8029:9000 \
    --name=minio \
    --restart=always \
    -e MINIO_ACCESS_KEY=minio \
    -e MINIO_SECRET_KEY=minio123 \
    -v /var/www/minio/data:/data \
    -v /var/www/minio/config/:/config \
    -v /var/www/minio/exchange:/exchange \
    minio/minio server -C /config /data