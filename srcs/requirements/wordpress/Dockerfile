FROM debian:buster

RUN apt-get update && \
    apt-get install -y wget php7.3 php-fpm php-mysqli php-xml php-mbstring

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/
RUN mkdir /run/php

EXPOSE 9000

COPY ./tools/wp_install.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/wp_install.sh

WORKDIR /var/www/html/

ENTRYPOINT ["/usr/local/bin/wp_install.sh"]