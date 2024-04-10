#!/usr/bin/bash

if [ -d "/var/www/wordpress/wp-admin" ]; then
	 echo "WordPress core is already downloaded"
else
	echo "WordPress Installing"
	wp core download --path=/var/www/wordpress --allow-root
fi

/usr/sbin/php-fpm7.4 -F
