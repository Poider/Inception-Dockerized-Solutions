#!/bin/bash


mkdir -p /var/www/wordpress
cd /var/www/wordpress
rm -rf *
wp core download --allow-root

mv /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php

sed -i  "/DB_NAME/s#.*#define( 'DB_NAME', '$DB_NAME' );#g" /var/www/wordpress/wp-config.php
sed -i  "/DB_USER/s#.*#define( 'DB_USER', '$DB_USER' );#g" /var/www/wordpress/wp-config.php
sed -i  "/DB_PASSWORD/s#.*#define( 'DB_PASSWORD', '$DB_PASS' );#g" /var/www/wordpress/wp-config.php
sed -i  "/DB_HOST/s#.*#define( 'DB_HOST', '$DB_HOST' );#g" /var/www/wordpress/wp-config.php

# Add Redis configuration to wp-config.php
# echo "define( 'WP_CACHE_KEY_SALT', 'wordpress:' );" >> /var/www/wordpress/wp-config.php
# echo "define( 'WP_CACHE', true );" >> /var/www/wordpress/wp-config.php
# echo "define( 'WP_REDIS_HOST', '$REDIS_HOST' );" >> /var/www/wordpress/wp-config.php
# echo "define( 'WP_REDIS_PORT', '$REDIS_PORT' );" >> /var/www/wordpress/wp-config.php
# echo "define( 'WP_REDIS_SELECTIVE_FLUSH', true );" >> /var/www/wordpress/wp-config.php


wp core install --url="$WORDPRESS_DOMAIN"/ --title="$WORDPRESS_TITLE" \
    --admin_user="$WORDPRESS_ADMIN_USER" --admin_password="$WORDPRESS_ADMIN_PASS" \
    --admin_email="$WORDPRESS_ADMIN_EMAIL" --skip-email --allow-root


if ! wp user list --field=user_login --allow-root | grep -wq $WORDPRESS_USER_NAME; then 
    wp user create $WORDPRESS_USER_NAME $WORDPRESS_USER_EMAIL --role=author \
        --user_pass=$WORDPRESS_USER_PASS --allow-root 
fi

wp plugin install redis-cache --activate --allow-root
wp redis enable --allow-root
wp config set WP_REDIS_HOST "redis" --allow-root 
wp config set WP_REDIS_PORT "6379" --allow-root 




# wp config set WP_REDIS_HOST redis --allow-root #I put --allowroot because i am on the root user on my VM
# wp config set WP_REDIS_PORT 6379 --raw --allow-root

# wp config set WP_REDIS_CLIENT phpredis --allow-root
# wp plugin install redis-cache --activate --allow-root
# wp plugin update --all --allow-root
# wp redis enable --allow-root


chown -R www-data:www-data /var/www/wordpress

/usr/sbin/php-fpm7.3 -F

