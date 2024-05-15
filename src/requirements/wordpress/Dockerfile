FROM debian:oldstable

RUN apt-get update && \
    apt-get install -y php-fpm php-mysql && \
    apt-get install -y curl && \
    rm -rf /var/lib/apt/lists/*

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /var/run/php

COPY ./tools/start.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/start.sh

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d

WORKDIR /var/www/html

RUN chown -R www-data:www-data /var/www/html

EXPOSE 9000

ENTRYPOINT ["bash", "/usr/local/bin/start.sh"]