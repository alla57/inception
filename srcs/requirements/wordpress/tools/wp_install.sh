#!/bin/sh

if [-f ./wordpress ]; then
    echo "Wordpress already installed"
else
    wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    sudo mv wp-cli.phar /usr/local/bin/wp

    wp core download --allow-root
    wp config create --allow-root \
        --dbname=$DB_NAME \
        --dbuser=$DB_USER \
        --dbpass=$DB_PASSWORD \
        --dbhost=$DB_HOST
    wp core install --url="http://alboumed.42.fr" --title="Blog Title" --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL
    wp user create $WP_USER $WP_USER_EMAIL --role=subscriber --user_pass=$WP_USER_PASSWORD
fi
/usr/sbin/php-fpm7.3 -F