FROM ubuntu:14.04

RUN apt-get update; apt-get upgrade -y; apt-get dist-upgrade -y

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y supervisor nginx php5-fpm php5-mysql php5-gd drush php-apc git mysql-client-5.6
RUN update-rc.d nginx disable
RUN update-rc.d php5-fpm disable
RUN update-rc.d supervisor disable

EXPOSE 8081

RUN mkdir -p /srv/drupal/config /srv/data /srv/logs /tmp

ADD site.conf /srv/drupal/config/site.conf
ADD nginx.conf /nginx.conf
ADD php-fpm.conf /php-fpm.conf
ADD supervisord.conf /supervisord.conf

CMD [ "/usr/bin/supervisord", "-n", "-c", "/supervisord.conf", "-e", "trace" ]
