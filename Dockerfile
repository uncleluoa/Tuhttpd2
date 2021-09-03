FROM debian
RUN apt update
RUN apt install  php apache2 wget git curl php-curl php-mysql -y
RUN mkdir -p /var/www/html
RUN git clone https://github.com/kalcaddle/KodExplorer.git
RUN mv KodExplorer /var/www/html/kod
RUN chmod 777 /var/www/html/ -R
EXPOSE 80
CMD apachectl -D FOREGROUND
