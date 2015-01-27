FROM ubuntu:14.04

RUN apt-get update; apt-get upgrade -y; apt-get dist-upgrade -y

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y supervisor nginx php5-fpm php5-sqlite php5-gd drush php-apc git
RUN update-rc.d nginx disable
RUN update-rc.d php5-fpm disable
RUN update-rc.d supervisor disable

EXPOSE 8081

RUN mkdir -p /srv/drupal/config /srv/data /srv/logs /tmp

ADD site.conf /srv/drupal/config/site.conf
ADD nginx.conf /nginx.conf
ADD php-fpm.conf /php-fpm.conf
ADD supervisord.conf /supervisord.conf

RUN chown -R www-data:www-data /srv/drupal/www/
RUN chown www-data:www-data /srv/data

ENTRYPOINT [ "/usr/bin/supervisord", "-n", "-c", "/supervisord.conf", "-e", "trace" ]
