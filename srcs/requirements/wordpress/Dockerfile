FROM debian:11-slim

RUN apt-get update && apt-get -y install curl php-fpm php-mysql
RUN mkdir -p /srv/www
RUN chown www-data: /srv/www
RUN curl https://wordpress.org/latest.tar.gz | tar zx -C /srv/www