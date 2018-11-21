#!/usr/bin/env bash
sudo docker run -di \
    --name mysql57 \
    --restart=always \
    -v /var/www/mysql:/var/lib/mysql \
    -e MYSQL_ROOT_PASSWORD=Zopen2013 \
    -p 13306:3306 \
    mysql:5.7


sudo docker exec -it mysql57 mysql -uroot -pZopen2013 -e "create database wssc charset='utf8';"
