#!/bin/bash

 if [ ! -d "/var/lib/mysql/$MYSQL_DATABASE" ]; then
service mariadb start
mysql -uroot -e "CREATE DATABASE $MYSQL_DATABASE;"
mysql -uroot -e "CREATE USER IF NOT EXISTS $MYSQL_USER@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
mysql -uroot -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO $MYSQL_USER@'%';"
mysql -uroot -e "FLUSH PRIVILEGES;"
sleep 5
service mariadb stop
fi
mysqld --bind-address=0.0.0.0