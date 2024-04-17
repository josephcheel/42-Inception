#!/usr/bin/bash

if [ -d "/var/www/wordpress/wp-admin" ]; then
	 echo "WordPress core is already downloaded"
else
	echo "WordPress Installing"
	wp core download --path=/var/www/wordpress --allow-root
	wp config create --path=/var/www/wordpress --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASSWORD --dbhost=my-mariadb:3306 --allow-root
	wp core install --path=/var/www/wordpress --url=$DOMAIN_NAME --title="my wordpress website!" --admin_user=$DB_USER --admin_password=$DB_PASSWORD  --admin_email=jcheel-n@student.42barcelona.com --skip-email --allow-root
	wp user create --path=/var/www/wordpress example example@example.com --role=contributor --user_pass=$DB_PASSWORD --allow-root
fi
#mv /var/www/wp-config.php /var/www/wordpress/wp-config.php

/usr/sbin/php-fpm7.4 -F
