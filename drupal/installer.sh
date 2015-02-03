#!/bin/bash

cd /srv/drupal/www/ && drush -y site-install standard --account-name=$ACCTNAME --account-pass=$ACCTPASS --db-url=mysql://$DBUSER:$DBPASS@$MYSQL_PORT_3306_TCP_ADDR/$DBNAME --site-name=$SITENAME

cd /srv/drupal/www/ && drush -y dl $DRUSHDLLIST
cd /srv/drupal/www/ && drush -y en $DRUSHDLLIST
cd /srv/drupal/www/ && drush -y vset theme_default $THEME
cd /srv/drupal/www/ && drush -y vset cache 1 --yes
cd /srv/drupal/www/ && drush -y vset block_cache 1 --yes
cd /srv/drupal/www/ && drush -y vset cache_lifetime 300 --yes
cd /srv/drupal/www/ && drush -y vset page_cache_maximum_age 300 --yes
cd /srv/drupal/www/ && drush -y vset preprocess_css 1 --yes
cd /srv/drupal/www/ && drush -y vset preprocess_js  1 --yes

chown -R www-data:www-data /srv/drupal/www/

