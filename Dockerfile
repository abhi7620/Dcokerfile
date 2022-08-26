FROM ubuntu:latest
MAINTAINER abhijeet.deshpande15@gmail.com
#ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y apache2 \
        zip \
    unzip
RUN apt-get update -y
RUN rm -rf /var/www/html/*
COPY staticwebsite.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip staticwebsite.zip
RUN cp -rvf staticwebsite/* .
RUN rm -rf staticwebsite staticwebsite.zip
CMD ["apache2ctl", "-D",  "FOREGROUND"]
EXPOSE 80
