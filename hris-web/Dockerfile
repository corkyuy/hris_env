FROM helder/drupal:5.3
##FROM drupal:7
#
##ADD ./docker-php-ext-mbstring.ini /usr/local/etc/php/conf.d/docker-php-ext-mbstring.ini
##ADD ./docker-php-ext-bcmath.ini /usr/local/etc/php/conf.d/docker-php-ext-bcmath.ini
##ADD ./docker-php-ext-xdebug.ini /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
ADD ./.bashrc /root/.bashrc
#
#RUN apt-get update && apt-get install -y mysql-client
#RUN apt-get update && apt-get install -y php-pear drush php5-xdebug
#RUN apt-get update && apt-get install -y default-jre
##RUN "mkdir /var/www/html/sites/default/files/reports"
##RUN "chmod 777 /var/www/html/sites/default/files/reports"
#
##RUN pecl install xdebug
##RUN docker-php-ext-enable xdebug
##RUN docker-php-ext-install bcmath
##RUN docker-php-ext-install mbstring
##RUN echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
##  && echo "xdebug.remote_autostart=off" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
##  && echo "xdebug.remote_host=192.168.1.6" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
##  && echo "mbstring.http_input = pass;" >> /usr/local/etc/php/conf.d/docker-php-ext-mbstring.ini \
##  && echo "mbstring.http_output = pass;" >> /usr/local/etc/php/conf.d/docker-php-ext-mbstring.ini
#
## && rm -rf /var/lib/apt/lists/*
## mbstring.ini is needed by phpamqp
## && rm /usr/local/etc/php/conf.d/docker-php-ext-mbstring.ini
#
