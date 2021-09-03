FROM mysql
RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt install  php apache2 wget git curl php-curl php-mysql -y
RUN mkdir -p /var/www/html
RUN git clone https://github.com/kalcaddle/KodExplorer.git
RUN mv KodExplorer /var/www/html/kod
RUN chmod 777 /var/www/html/ -R
RUN echo 'MYSQL_ROOT_PASSWORD=root' >/1.sh
RUN echo 'mysqld' >>/1.sh
RUN echo 'apachectl -D FOREGROUND' >>/1.sh
RUN chmod 755 /1.sh
EXPOSE 80
CMD /1.sh

