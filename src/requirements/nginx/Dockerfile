FROM debian:oldstable
 
RUN apt-get update && \
    apt-get install -y nginx openssl

RUN rm -rf /etc/nginx/conf.d/nginx.conf
COPY ./conf/nginx.conf /etc/nginx/sites-available/default
COPY ./conf/eduarodr.42.fr.crt /etc/ssl/certs/nginx.crt
COPY ./conf/eduarodr.42.fr.key /etc/ssl/private/nginx.key

EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]
