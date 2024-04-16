mysql_install_db
# sleep 3
service mariadb start;

DB_EXISTS=$(mysql -u ${MARIADB_ROOT} -e "SHOW DATABASES LIKE '${MARIADB_DB_NAME}';" | grep ${MARIADB_DB_NAME})

if [ -n "$DB_EXISTS" ]; then
	echo "Mariadb $MARIADB_DB_NAME database exists."
else
	echo "Mariadb $MARIADB_DB_NAME database does not exist."
	mysql --verbose -u ${MARIADB_ROOT} -e "CREATE DATABASE $MARIADB_DB_NAME;"
	mysql  --verbose -u ${MARIADB_ROOT} -e "DROP USER IF EXISTS '$MARIADB_USER'@'%' ;"
	mysql --verbose -u ${MARIADB_ROOT} -e "FLUSH PRIVILEGES;"
	mysql  --verbose -u ${MARIADB_ROOT} -e "CREATE USER '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_USER_PASSWORD'"
	mysql  --verbose -u ${MARIADB_ROOT} -e "ALTER USER '${MARIADB_USER}'@'%' IDENTIFIED BY '${MARIADB_USER_PASSWORD}';"
	mysql --verbose -u ${MARIADB_ROOT} -e "FLUSH PRIVILEGES;"
	mysql  --verbose -u ${MARIADB_ROOT} -e "GRANT ALL ON $MARIADB_DB_NAME.* TO '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_USER_PASSWORD' WITH GRANT OPTION;"
	mysql --verbose -u ${MARIADB_ROOT} -e "FLUSH PRIVILEGES;"
	mysql  --verbose -u ${MARIADB_ROOT} -e "ALTER USER '${MARIADB_ROOT}'@'localhost' IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}';"
	# echo "CREATE DATABASE $MARIADB_DB_NAME ;" > db1.sql
	# echo "DROP USER IF EXISTS '$MARIADB_USER'@'%' ;" > db1.sql ;
	# echo "CREATE USER '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_USER_PASSWORD' ;" > db1.sql
	# echo "FLUSH PRIVILEGES;" > db1.sql
	# echo "GRANT ALL ON $MARIADB_DB_NAME.* TO '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_USER_PASSWORD' WITH GRANT OPTION ;" > db1.sql
	# echo "sALTER USER '${MARIADB_ROOT}'@'localhost' IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}' ;" > db1.sql
	# mysql < db1.sql
fi

mysqladmin -u ${MARIADB_ROOT} --password=${MARIADB_ROOT_PASSWORD} shutdown

mysqld
