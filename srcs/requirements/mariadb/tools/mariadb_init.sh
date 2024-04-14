#!/bin/bash

# DB_EXISTS=$(mysql -u ${MARIADB_ROOT} -e "SHOW DATABASES LIKE '${MARIADB_DB_NAME}';" | grep ${MARIADB_DB_NAME})


# if [ -n "$DB_EXISTS" ]; then
# 	echo "Mariadb $MARIADB_DB_NAME database exists."
# else
# 	echo "Mariadb $MARIADB_DB_NAME database does not exist."
# 	# mysql -u $MARIADB_ROOT -e "CREATE USER '{$MARIADB_USER}'@'%' IDENTIFIED BY '${MARIADB_DB_PASSWORD}';"
# 	# mysql -u $MARIADB_ROOT -e "GRANT ALL PRIVILEGES ON ${MARIADB_DB_NAME}.* TO '{$MARIADB_USER}'@'%' WITH GRANT OPTION;"
# 	# mysql -u $MARIADB_ROOT -e "CREATE DATABASE '${MARIADB_DB_NAME}';"
# 	# mysql -u $MARIADB_ROOT -p${MARIADB_ROOT_PASSWORD} -e "ALTER USER '${MARIADB_ROOT}'@'localhost' IDENTIFIED BY '{$MARIADB_ROOT_PASSWORD}';"
# 	# mysql -u $MARIADB_ROOT -p${MARIADB_ROOT_PASSWORD} -e "FLUSH PRIVILEGES;"
# fi
# mysqladmin -u ${MARIADB_ROOT} --password=${MARIADB_ROOT_PASSWORD} shutdown

# mysqld

mysql_install_db
sleep 3
service mariadb start;
# while ! mysqladmin ping --silent; do
# 	sleep 1
# done
if [ ! -d /var/lib/mysql/${MARIADB_DB_NAME} ];
then
	echo "inside"
	mysql -u ${MARIADB_ROOT} -p${MARIADB_ROOT_PASSWORD} -e "CREATE DATABASE $MARIADB_DB_NAME;"
	mysql -u ${MARIADB_ROOT} -p${MARIADB_ROOT_PASSWORD} -e "CREATE USER '$MARIADB_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'"
	mysql -u ${MARIADB_ROOT} -p${MARIADB_ROOT_PASSWORD} -e "GRANT ALL ON $MARIADB_DB_NAME.* TO '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_USER_PASSWORD' WITH GRANT OPTION;"
	mysql -u ${MARIADB_ROOT} -p${MARIADB_ROOT_PASSWORD} -e "FLUSH PRIVILEGES;"
	mysql -u ${MARIADB_ROOT} -p${MARIADB_ROOT_PASSWORD} -e "ALTER USER '${MARIADB_ROOT}'@'localhost' IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}';"
	mysql -u ${MARIADB_ROOT} -p${MARIADB_ROOT_PASSWORD} -e "DROP USER 'mysql'@'%';"
fi

mysqladmin -u ${MARIADB_ROOT} --password=${MARIADB_ROOT_PASSWORD} shutdown

mysqld