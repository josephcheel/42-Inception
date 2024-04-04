#!/usr/bin/bash

if [ -d "/var/www/wordpress/wp-admin" ]; then
	 echo "WordPress core is already downloaded"
else
	wp core download --path=wordpress/ --allow-root
fi

/usr/sbin/php-fpm7.4 -F