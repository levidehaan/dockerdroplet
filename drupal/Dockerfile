FROM ubuntu:14.04

ENV SITENAME default

ENV DBUSER drupal
ENV DBPASS cheesenoodles
ENV ACCTNAME admin
ENV ACCTPASS chezisgood
ENV DRUSHDLLIST="devel views views_ui responsive_bartik"
ENV THEME responsive_bartik

RUN apt-get update; apt-get upgrade -y; apt-get dist-upgrade -y

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y drush mysql-client php5-gd php-db php5-mysql

RUN mkdir -p /var/run/sshd /srv/drupal/www /srv/drupal/config /srv/data /srv/logs /tmp

RUN cd /tmp && drush dl drupal && mv /tmp/drupal*/* /srv/drupal/www/ && rm -rf /tmp/*

RUN chmod a+w /srv/drupal/www/sites/default && mkdir /srv/drupal/www/sites/default/files

RUN chown -R www-data:www-data /srv/drupal/www/

ADD settings.php /srv/drupal/www/sites/default/settings.php

RUN chmod a+w /srv/drupal/www/sites/default/settings.php

RUN chown www-data:www-data /srv/data

RUN chmod a-w /srv/drupal/www/sites/default/settings.php

RUN cd /srv/drupal/www/ && drush -y site-install standard --account-name=$ACCTNAME --account-pass=$ACCTPASS --db-url=mysql://$DBUSER:$DBPASS@mysql/$DBNAME --site-name=$SITENAME

RUN cd /srv/drupal/www/ && drush -y dl $DRUSHDLLIST
RUN cd /srv/drupal/www/ && drush -y en $DRUSHDLLIST
RUN cd /srv/drupal/www/ && drush -y vset theme_default $THEME
RUN cd /srv/drupal/www/ && drush -y vset cache 1 --yes
RUN cd /srv/drupal/www/ && drush -y vset block_cache 1 --yes
RUN cd /srv/drupal/www/ && drush -y vset cache_lifetime 300 --yes
RUN cd /srv/drupal/www/ && drush -y vset page_cache_maximum_age 300 --yes
RUN cd /srv/drupal/www/ && drush -y vset preprocess_css 1 --yes
RUN cd /srv/drupal/www/ && drush -y vset preprocess_js  1 --yes

RUN chown -R www-data:www-data /srv/drupal/www/

VOLUME ["/srv/drupal/www"]

ENTRYPOINT [ "/usr/bin/supervisord", "-n", "-c", "/supervisord.conf", "-e", "trace" ]