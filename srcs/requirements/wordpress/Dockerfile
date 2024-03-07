FROM debian:11-slim


RUN apt-get update -y && apt-get -y install curl php-fpm php-mysql mariadb-client

RUN mkdir -p /run/php/
RUN mkdir -p /var/www/wordpress
# Wordpress installation

# RUN curl https://wordpress.org/latest.tar.gz | tar zx -C /var/www
WORKDIR /var/www/
RUN curl -o latest.tar.gz https://wordpress.org/latest.tar.gz
RUN tar -xvzf latest.tar.gz -C /tmp
RUN mv /tmp/wordpress/ var/www/wordpress
# RUN chown www-data: /var/www && chmod +x /var/www/wordpress
EXPOSE 9000


CMD ["/usr/sbin/php-fpm7.4", "-F"]