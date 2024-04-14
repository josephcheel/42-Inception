FROM debian:11-slim

RUN apt-get update 
RUN apt-get install -y mariadb-server

EXPOSE 3306

#RUN useradd -r -g mysql mysql \
RUN mkdir -p /run/mariadb
COPY ./tools/mariadb_init.sh /run/mariadb/mariadb_init.sh
COPY ./config/my.cnf /etc/mysql/mariadb.conf.d/myserver.cnf

RUN mkdir -p /var/run/mysqld \
	&& chown -R mysql:mysql /var/run/mysqld \
	&& chmod 777 /var/run/mysqld

# RUN chown -R mysql:mysql /var/lib/mysql
# RUN chown -R mysql:mysql /var/run/mysqld

# RUN mkdir -p /run/mariadb
RUN chmod +x /run/mariadb/mariadb_init.sh

# RUN mysql_install_db 
#RUN service mariadb start
RUN mkdir  -p /var/log/mariadb && touch /var/log/mariadb/error.log
ENTRYPOINT ["bash", "/run/mariadb/mariadb_init.sh"]

#CMD ["bash", "/run/mariadb/mariadb_init.sh"]
#CMD ["tail", "-f", "/var/log/mariadb/error.log"]
#CMD ["mysqld"]