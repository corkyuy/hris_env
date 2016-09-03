FROM ubuntu:precise

ADD ./default.settings.php /var/www/html/sites/default/default.settings.php
ADD ./settings.php /var/www/html/sites/default/settings.php

ADD ./default.settings.php /var/www/htdocs/sites/default/default.settings.php
ADD ./settings.php /var/www/htdocs/sites/default/settings.php

RUN mkdir -p /var/www/html/sites/default \
  && touch /var/www/html/sites/default/default.settings.php \
  && touch /var/www/html/sites/default/settings.php \
  && chown -R www-data:www-data /var/www/html/sites/default \
  && mkdir -p /var/www/html/sites/default/files/reports \
  && chmod 777 /var/www/html/sites/default/files/reports
RUN mkdir -p /var/www/htdocs/sites/default \
  && touch /var/www/htdocs/sites/default/default.settings.php \
  && touch /var/www/htdocs/sites/default/settings.php \
  && chown -R www-data:www-data /var/www/htdocs/sites/default \
  && mkdir -p /var/www/htdocs/sites/default/files/reports \
  && chmod 777 /var/www/htdocs/sites/default/files/reports
VOLUME /var/lib/mysql
VOLUME /var/www/html
VOLUME /var/www/html/sites/default
VOLUME /var/www/htdocs
VOLUME /var/www/htdocs/sites/default
CMD ["echo", "Data container for HRIS"]
