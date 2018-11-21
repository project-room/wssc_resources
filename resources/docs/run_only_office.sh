#!/usr/bin/env bash
sudo docker run -di \
    -p 8019:80 \
    --name=onlyoffice \
    --restart=always \
    -v /var/www/onlyoffice/documentserver/logs:/var/log/onlyoffice  \
    -v /var/www/onlyoffice/documentserver/data:/var/www/onlyoffice/Data  \
    -v /var/www/onlyoffice/documentserver/lib:/var/lib/onlyoffice \
    -v /var/www/onlyoffice/documentserver/db:/var/lib/postgresql \
    -v /var/www/onlyoffice/documentserver/fonts:/usr/share/fonts \
    -v /var/www/onlyoffice/documentserver/exchange:/exchange \
    onlyoffice/documentserver