FROM debian
RUN apt update
RUN apt install ssh wget squid -y
RUN mkdir /run/sshd 
RUN echo 'squid' >>/1.sh
RUN echo '/usr/sbin/sshd -D' >>/1.sh
RUN echo 'PermitRootLogin yes' >>  /etc/ssh/sshd_config 
RUN echo root:Tu!192168|chpasswd
RUN chmod 755 /1.sh
RUN echo 'acl localnet src 0.0.0.1-0.255.255.255 ' >  /etc/squid/squid.conf 
RUN echo ' acl localnet src 10.0.0.0/8  ' >>  /etc/squid/squid.conf 
RUN echo ' acl localnet src 100.64.0.0/10 ' >>  /etc/squid/squid.conf
RUN echo ' acl localnet src 169.254.0.0/16' >>  /etc/squid/squid.conf
RUN echo ' acl localnet src 172.16.0.0/12 ' >>  /etc/squid/squid.conf
RUN echo 'acl localnet src 192.168.0.0/16 ' >>  /etc/squid/squid.conf
RUN echo ' acl localnet src fc00::/7 ' >>  /etc/squid/squid.conf
RUN echo ' acl localnet src fe80::/10' >>  /etc/squid/squid.conf
RUN echo 'acl SSL_ports port 443 ' >>  /etc/squid/squid.conf
RUN echo 'acl Safe_ports port 80 ' >>  /etc/squid/squid.conf
RUN echo 'acl Safe_ports port 21 ' >>  /etc/squid/squid.conf
RUN echo 'acl Safe_ports port 443  ' >>  /etc/squid/squid.conf
RUN echo ' acl Safe_ports port 70' >>  /etc/squid/squid.conf
RUN echo 'acl Safe_ports port 210  ' >>  /etc/squid/squid.conf
RUN echo ' acl Safe_ports port 1025-65535' >>  /etc/squid/squid.conf
RUN echo ' acl Safe_ports port 280 ' >>  /etc/squid/squid.conf
RUN echo 'acl Safe_ports port 488  ' >>  /etc/squid/squid.conf
RUN echo ' acl Safe_ports port 591' >>  /etc/squid/squid.conf
RUN echo ' acl Safe_ports port 777' >>  /etc/squid/squid.conf
RUN echo ' http_access allow all' >>  /etc/squid/squid.conf
RUN echo 'include /etc/squid/conf.d/*  ' >>  /etc/squid/squid.conf
RUN echo 'http_access allow localhost ' >>  /etc/squid/squid.conf
RUN echo ' http_port 80' >>  /etc/squid/squid.conf
RUN echo ' https_port 443' >>  /etc/squid/squid.conf
RUN echo ' acl SSL_ports port 22' >>  /etc/squid/squid.conf
RUN echo ' acl Safe_ports port 22' >>  /etc/squid/squid.conf
RUN echo ' coredump_dir /var/spool/squid' >>  /etc/squid/squid.conf
EXPOSE 80 443
CMD  /1.sh
