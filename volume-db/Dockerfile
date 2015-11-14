FROM debian:jessie

ADD ./default.settings.php /var/www/html/sites/default/default.settings.php
ADD ./settings.php /var/www/html/sites/default/settings.php

RUN mkdir -p /var/www/html/sites/default \
  && touch /var/www/html/sites/default/default.settings.php \
  && touch /var/www/html/sites/default/settings.php \
  && chown -R www-data:www-data /var/www/html/sites/default
VOLUME /var/lib/mysql
VOLUME /var/www/html
VOLUME /var/www/html/sites/default

CMD ["echo", "Data container for HRIS"]
