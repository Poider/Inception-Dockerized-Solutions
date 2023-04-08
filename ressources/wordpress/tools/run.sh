#!/bin/bash
#mv /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php
#cd /var/www/
mkdir -p /var/www/wordpress
cd /var/www/wordpress
rm -rf *
wp core download --allow-root

mv /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php

#mv wordpress ./var/www/

sed -i  "/DB_NAME/s#.*#define( 'DB_NAME', '$DB_NAME' );#g" /var/www/wordpress/wp-config.php
sed -i  "/DB_USER/s#.*#define( 'DB_USER', '$DB_USER' );#g" /var/www/wordpress/wp-config.php
sed -i  "/DB_PASSWORD/s#.*#define( 'DB_PASSWORD', '$DB_PASS' );#g" /var/www/wordpress/wp-config.php
sed -i  "/DB_HOST/s#.*#define( 'DB_HOST', '$DB_HOST' );#g" /var/www/wordpress/wp-config.php

wp core install --url="$WORDPRESS_DOMAIN"/ --title="$WORDPRESS_TITLE" \
    --admin_user="$WORDPRESS_ADMIN_USER" --admin_password="$WORDPRESS_ADMIN_PASS" \
    --admin_email="$WORDPRESS_ADMIN_EMAIL" --skip-email --allow-root


if ! wp user list --field=user_login | grep -wq $WORDPRESS_USER_NAME; then 
    wp user create $WORDPRESS_USER_NAME $WORDPRESS_USER_EMAIL --role=author \
        --user_pass=$WORDPRESS_USER_PASS --allow-root 
fi

# tail -f /dev/null

/usr/sbin/php-fpm7.3 -F
