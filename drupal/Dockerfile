FROM ubuntu:14.04

ENV SITENAME default

ENV DBNAME drupal
ENV DBUSER drupal
ENV DBPASS cheesenoodles
ENV ACCTNAME admin
ENV ACCTPASS chezisgood
ENV DRUSHDLLIST="devel views views_ui responsive_bartik"
ENV THEME responsive_bartik

RUN apt-get update; apt-get upgrade -y; apt-get dist-upgrade -y

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y supervisor supervisor nginx php5-fpm php5-mysql php5-gd drush php-apc git mysql-client-5.6

RUN mkdir -p /var/run/sshd /srv/drupal/www /srv/drupal/config /srv/data /srv/logs /tmp

RUN cd /tmp && drush dl drupal && mv /tmp/drupal*/* /srv/drupal/www/ && rm -rf /tmp/*

RUN chmod a+w /srv/drupal/www/sites/default && mkdir /srv/drupal/www/sites/default/files

RUN chown www-data:www-data /srv/drupal/www -R

ADD settings.php /srv/drupal/www/sites/default/settings.php

ADD installer.sh /root/installer.sh

RUN chmod a+w /srv/drupal/www/sites/default/settings.php

RUN chown www-data:www-data /srv/data

RUN chmod a-w /srv/drupal/www/sites/default/settings.php

RUN printenv

VOLUME ["/srv/drupal/www"]