FROM drupal:7

#ADD ./docker-php-ext-mbstring.ini /usr/local/etc/php/conf.d/docker-php-ext-mbstring.ini
#ADD ./docker-php-ext-bcmath.ini /usr/local/etc/php/conf.d/docker-php-ext-bcmath.ini
#ADD ./docker-php-ext-xdebug.ini /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
ADD ./.bashrc /root/.bashrc

RUN apt-get update && apt-get install -y mysql-client
RUN apt-get update && apt-get install -y php-pear drush php5-xdebug

RUN pecl install xdebug
RUN docker-php-ext-enable xdebug
RUN docker-php-ext-install bcmath
RUN echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
  && echo "xdebug.remote_autostart=off" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
  && echo "xdebug.remote_host=192.168.1.6" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

# && rm -rf /var/lib/apt/lists/*
# mbstring.ini is needed by phpamqp
# && rm /usr/local/etc/php/conf.d/docker-php-ext-mbstring.ini

