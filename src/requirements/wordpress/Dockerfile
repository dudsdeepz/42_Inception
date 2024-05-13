FROM debian:oldstable

RUN apt-get update && \
    apt-get install -y php-fpm php-mysql && \
    apt-get install -y curl && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/php

WORKDIR /var/www/html

RUN chown -R www-data:www-data /var/www/html

RUN curl -o wordpress.tar.gz https://wordpress.org/latest.tar.gz && \
    tar -xzf wordpress.tar.gz -C /var/www/html && \
    rm wordpress.tar.gz

RUN chmod 777 /var/www/html/wordpress

EXPOSE 9000

CMD ["php-fpm7.4", "--nodaemonize"]