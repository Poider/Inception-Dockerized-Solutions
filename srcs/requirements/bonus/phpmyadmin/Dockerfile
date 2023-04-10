FROM debian:buster

RUN apt-get update && \
    apt-get install -y php php-mysqli php-mbstring php-gettext php-curl php-gd php-zip curl unzip && \
    rm -rf /var/lib/apt/lists/*

RUN curl -SL -o /tmp/phpmyadmin.zip https://files.phpmyadmin.net/phpMyAdmin/5.1.1/phpMyAdmin-5.1.1-all-languages.zip && \
    unzip -q /tmp/phpmyadmin.zip -d /usr/share/ && \
    mv /usr/share/phpMyAdmin-5.1.1-all-languages /usr/share/phpmyadmin && \
    rm /tmp/phpmyadmin.zip

EXPOSE 9092

COPY /conf/config.inc.php /usr/share/phpmyadmin/

CMD ["php", "-S", "0.0.0.0:9092", "-t", "/usr/share/phpmyadmin"]
