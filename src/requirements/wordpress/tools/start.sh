#!/bin/bash

cd /var/www/html

wp core download --allow-root

sleep 10

sed -i "s/database_name_here/$WORDPRESS_DB_NAME/" /var/www/html/wp-config-sample.php
sed -i "s/username_here/$WORDPRESS_DB_USER/" /var/www/html/wp-config-sample.php
sed -i "s/password_here/$WORDPRESS_DB_PASSWORD/" /var/www/html/wp-config-sample.php
sed -i "s/localhost/$WORDPRESS_DB_HOST/" /var/www/html/wp-config-sample.php

cp wp-config-sample.php wp-config.php

wp core install --allow-root --url="$WORDPRESS_URL" --title="$WORDPRESS_SITE_TITLE" \
    --admin_user="$WORDPRESS_ADMIN_USER" --admin_password="$WORDPRESS_ADMIN_PASSWORD" \
    --admin_email="$WORDPRESS_ADMIN_EMAIL" --skip-email

chown -R www-data:www-data /var/www/html/wp-content

exec /usr/sbin/php-fpm7.4 --nodaemonize