FROM debian:oldstable

RUN apt-get update && \
    apt-get install -y mariadb-server && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /run/mysqld
RUN chown -R mysql:mysql /run/mysqld

RUN mkdir -p /var/run/mysqld
RUN chown -R mysql:mysql /var/run/mysqld
COPY ./tools/start.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/start.sh

EXPOSE 3306

ENTRYPOINT ["bash", "/usr/local/bin/start.sh"]
