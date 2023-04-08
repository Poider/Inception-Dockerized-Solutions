FROM debian:buster


RUN apt-get -y update
RUN apt install -y curl 
RUN apt-get -y install php-mysql 
RUN apt-get -y install php-fpm
RUN mkdir -p /run/php/

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY ./tools/www.conf  etc/php/7.3/fpm/pool.d/www.conf

COPY ./tools/run.sh /
RUN chmod +x /run.sh


CMD ["/run.sh"]