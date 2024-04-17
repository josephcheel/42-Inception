FROM debian:11-slim


RUN apt-get update -y
RUN apt-get -y install curl php-fpm php-mysql mariadb-client

RUN mkdir -p /run/php/
RUN mkdir -p /var/www/wordpress
# Wordpress installation
EXPOSE 9000

WORKDIR /var/www/


RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

# RUN chown www-data: /var/www && chmod +x /var/www/wordpress

COPY ./tools/wp_init.sh /opt/wp_init.sh
COPY ./config/www.conf /etc/php/7.4/fpm/pool.d/www.conf

#CMD ["/usr/sbin/php-fpm7.4", "-F"]
# php-fpm7 --nodaemonize
ENTRYPOINT ["bash", "/opt/wp_init.sh"]
