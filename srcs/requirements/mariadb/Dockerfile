FROM debian:buster

RUN apt-get update && apt-get install -y mariadb-server

RUN apt-get install -y mariadb-server

COPY ./tools/run.sh /

COPY ./tools/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN chmod +x /run.sh

CMD ["/run.sh"]