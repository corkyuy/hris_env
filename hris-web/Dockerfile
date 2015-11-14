FROM drupal:7
ADD ./.bashrc /root/.bashrc
ADD docker-php-ext-mbstring.ini /usr/local/etc/php/conf.d/docker-php-ext-mbstring.ini
RUN apt-get update && apt-get install -y mysql-client
# && rm -rf /var/lib/apt/lists/*

# mbstring.ini is needed by phpamqp
# && rm /usr/local/etc/php/conf.d/docker-php-ext-mbstring.ini
RUN pear channel-discover pear.drush.org && pear install drush/drush
