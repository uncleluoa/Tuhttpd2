
FROM debian
RUN apt update
RUN apt install ssh wget npm nginx -y
RUN  npm install -g wstunnel
RUN mkdir /run/sshd 
RUN wget https://raw.githubusercontent.com/jinshulumengchuang/Tuhttpd2/main/default
RUN rm /etc/nginx/sites-enabled/default
RUN mv default /etc/nginx/sites-enabled/
RUN echo 'Is Tutu!' >/usr/share/nginx/html/index.html
RUN echo 'wstunnel -s 0.0.0.0:8181 & ' >>/1.sh
RUN echo 'nginx' >>/1.sh
RUN echo '/usr/sbin/sshd -D' >>/1.sh
RUN echo 'PermitRootLogin yes' >>  /etc/ssh/sshd_config 
RUN echo root:Tu!192168|chpasswd
RUN chmod 755 /1.sh
EXPOSE 80
CMD  /1.sh 
