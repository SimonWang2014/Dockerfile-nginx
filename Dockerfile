
FROM wangh/ssh:latest

MAINTAINER wangh<wanghui94@live.com>

RUN apt-get install -y nginx && rm -rf /var/lib/apt/lists/* && echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \
	chown -R www-data:www-data /var/lib/nginx

#设置系统时间
RUN echo "Asia/Shanghai" > /etc/timezone && \
	dpkg-reconfigure -f noninteractive tzdata

ADD run.sh /run.sh
RUN chmod 755 /*.sh

VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx"]

WORKDIR /etc/nginx

CMD ["/run.sh"]

EXPOSE 80
EXPOSE 443
