FROM debian:oldstable

RUN apt-get update
RUN apt-get install -y mariadb-server
RUN rm -rf /var/lib/apt/lists/*

RUN mkdir -p /run/mysqld
RUN chown -R mysql:mysql /run/mysqld

RUN mkdir -p /var/run/mysqld
RUN chown -R mysql:mysql /var/run/mysqld


EXPOSE 3306

CMD ["mysqld"]