FROM debian:buster

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    wget \
    php7.3 \
    php7.3-common \
    php7.3-cli \
    php7.3-fpm \
    php7.3-curl \
    php7.3-gd \
    php7.3-intl \
    php7.3-json \
    php7.3-mbstring \
    php7.3-mysql \
    php7.3-opcache \
    php7.3-readline \
    php7.3-xml \
    php7.3-zip \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /var/www

RUN wget --no-check-certificate https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php && \
    mv adminer-4.8.1.php index.php && chown -R root:root /var/www/

EXPOSE 9093

CMD [ "php", "-S", "[::]:9093", "-t", "/var/www" ]
