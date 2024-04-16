#!/usr/bin/bash

if [ -d "/var/www/wordpress/wp-admin" ]; then
	 echo "WordPress core is already downloaded"
else
	echo "WordPress Installing"
	wp core download --path=/var/www/wordpress --allow-root
	# wp config DB_NAME $DB_NAME
	# wp config DB_USER $DB_USER
	# wp config DB_PASSWORD $DB_PASSWORD
	wp config create --dbname=$DB_NAME-dbuser=$DB_USER --dbpass=$DB_PASSWORD
fi
#mv /var/www/wp-config.php /var/www/wordpress/wp-config.php

/usr/sbin/php-fpm7.4 -F
