FROM debian:11-slim

RUN apt-get update && apt-get install -y nginx openssl

RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/jcheel-n.42.fr.key -out /etc/nginx/ssl/jcheel-n.42.fr.crt -subj "/C=/ST=/L=/O=/OU=/CN=/UID="

EXPOSE 443

COPY ./config /etc/nginx/sites-available/

CMD ["nginx", "-g", "daemon off;"]
