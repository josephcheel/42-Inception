FROM debian:11-slim

#WORKDIR 
RUN apt-get update && apt-get install -y nginx openssl
# RUN systemctl start nginx
# RUN sudo ufw allow ‘nginx full’

EXPOSE 443
COPY ./config /etc/nginx/sites-available/
CMD ["nginx", "-g", "daemon off;"]
