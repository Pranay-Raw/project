FROM alpine:latest

RUN apk add --no-cache apache2 unzip wget && \
    wget -O /var/www/localhost/htdocs/website.zip https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip && \
    unzip -q /var/www/localhost/htdocs/website.zip -d /var/www/localhost/htdocs/ && \
    mv /var/www/localhost/htdocs/photogenic/* /var/www/localhost/htdocs/ && \
    rm -rf /var/www/localhost/htdocs/photogenic /var/www/localhost/htdocs/website.zip

EXPOSE 80

CMD ["httpd", "-D", "FOREGROUND"]
