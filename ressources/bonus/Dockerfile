FROM debian

RUN apt-get update && \
    apt-get -y install nginx


RUN mkdir /var/www/bonus

COPY ./website/* /var/www/bonus/
COPY ./tools/myconfig.conf /etc/nginx/sites-available/default

EXPOSE 9090

CMD ["nginx", "-g", "daemon off;"]
