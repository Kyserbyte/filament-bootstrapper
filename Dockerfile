FROM php:8.3-fpm-bullseye

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    git \
    zip \
    unzip \
    libicu-dev \
 && mkdir -p /app \
 && mkdir -p /.composer && chmod -R 777 /.composer/
WORKDIR /app
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
 && php -r "if (hash_file('sha384', 'composer-setup.php') === 'e21205b207c3ff031906575712edab6f13eb0b361f2085f1f1237b7126d785e826a450292b6cfd1d64d92e6563bbde02') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
 && php composer-setup.php \
 && php -r "unlink('composer-setup.php');" \
 && mv composer.phar /usr/local/bin/composer \
 && docker-php-ext-configure intl && docker-php-ext-install intl \
#  && docker-php-ext-install pdo pdo_mysql \
 && cp /usr/local/etc/php/php.ini-development /usr/local/etc/php/php.ini

EXPOSE 9000