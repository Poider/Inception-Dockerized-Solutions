FROM debian:buster

RUN apt-get update && \
    apt-get -y install nginx


RUN mkdir /var/www/bonus

COPY ./website_files/* /var/www/bonus/
COPY ./conf/myconfig.conf /etc/nginx/sites-available/default

EXPOSE 9090

CMD ["nginx", "-g", "daemon off;"]
