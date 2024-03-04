FROM debian:11-slim

#WORKDIR 
RUN apt-get update && apt-get install -y mariadb-server
# CMD ["nginx", "-g", "daemon off;"]
EXPOSE 3306
CMD ["mariadb"]