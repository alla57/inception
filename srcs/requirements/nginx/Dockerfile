FROM debian:buster

RUN apt-get update && \
    apt-get install -y nginx openssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -sha256 \
	-out /etc/ssl/certs/ssl_certificate.crt \ 
	-keyout /etc/ssl/certs/ssl_key.key \ 
	-subj "/C=FR/ST=Ile-De-France/L=Paris/O=42/OU=42Paris/CN=alboumed"


COPY ./conf/nginx.conf /etc/nginx/conf.d

EXPOSE 443

CMD ["nginx", "-g", "-daemon off;"]