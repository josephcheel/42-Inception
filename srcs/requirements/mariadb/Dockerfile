FROM debian:11-slim

#WORKDIR 
RUN apt-get update 
RUN apt-get install -y mariadb-server
#RUN service mariadb enable
RUN service mariadb start
# CMD ["nginx", "-g", "daemon off;"]
EXPOSE 3306
RUN mkdir -p /var/mariadb

# docker run -d --name mariadb-wp -p 3306:3306 -v '/path/on/host/:/var/lib/mysql' -e "MARIADB_ROOT_PASSWORD=" -e "MARIADB_DATABASE=wordpress" -e "MARIADB_USER=wordpress" -e "MARIADB_PASSWORD=" mariad
RUN mysql_install_db --datadir=/var/lib/mysql --auth-root-authentication-method=normal
#RUN service mysql start
# RUN mysql -e "CREATE DATABASE $MARIADB_DB_NAME;"
# RUN mysql -e "CREATE USER $MARIADB_USER@localhost IDENTIFIED BY $MARIADB_PASSWORD;"
CMD ["mysqld"]