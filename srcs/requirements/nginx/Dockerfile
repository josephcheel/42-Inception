FROM debian:11-slim

#WORKDIR 
RUN apt-get update && apt-get install -y nginx openssl
# RUN systemctl start nginx
# RUN sudo ufw allow ‘nginx full’

EXPOSE 443
COPY ./config /etc/nginx/sites-available/
CMD ["nginx", "-g", "daemon off;"]
#CMD ["openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/apache-selfsigned.key -out /etc/ssl/certs/apache-selfsigned.crt"]
