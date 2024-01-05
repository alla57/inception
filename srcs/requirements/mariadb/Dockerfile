FROM debian:buster

RUN apt-get update && \
    apt-get install -y mariadb-server mariadb-client

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d
COPY ./tools/create_db.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/create_db.sh

EXPOSE 3306

ENTRYPOINT ["/usr/local/bin/create_db.sh"]