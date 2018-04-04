FROM drupal:fpm

MAINTAINER brendan_anderson@hcpss.org
LABEL vendor="Howard County Public School System"
LABEL version="1.0.0"

RUN apt-get update && apt-get install -y wget git mysql-client \
    && wget https://getcomposer.org/installer \
    && php ./installer \
    && ./composer.phar require drush/drush "8.x" \
    && rm ./composer.phar ./installer
    
CMD ["/var/www/html/vendor/bin/drush"]
