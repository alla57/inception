#!/bin/sh

service mysql start

mysql -e "CREATE USER IF NOT EXISTS \`${DB_USER}\`@'localhost' IDENTIFIED BY '${DB_PASSWORD}';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';"
mysql -e "FLUSH PRIVILEGES;"
mysql -e "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;"
mysqladmin -u root -p$DB_ROOT_PASSWORD shutdown

exec mysqld_safe

mysql -e "FLUSH PRIVILEGES;"

mysqladmin -u root -p$DB_ROOT_PASSWORD shutdown

exec mysqld_safe