FROM ubuntu:latest
MAINTAINER Artem Manchenkov <artyom@manchenkoff.me>

### Update repositories
RUN apt-get update

### Install Apache
RUN apt-get install -y apache2 apache2-utils curl gnupg wget
RUN a2enmod rewrite

### Git, Python, Perl, NodeJS, NPM, PHP 7
ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - \
    && apt-get install -y nodejs

RUN apt-get install -y git python3 perl \
    php nano

### PHP Extensions
RUN apt-get install -y \
    php-pdo php-pdo-mysql \
    php-pdo-pgsql php-pdo-sqlite \
    php-mbstring php-tokenizer \
    php-xml php-simplexml php-zip \
    php-opcache php-iconv php-intl \
    php-json php-gd php-ctype php-oauth \
    php-mongodb php-xdebug php-redis \
    php-apcu php-imagick \
    php-memcached php-ftp php-imap \
    php-exif php-sqlite3 php-curl

### PHP Composer, Supervisor
RUN apt-get install -y composer supervisor
RUN update-rc.d supervisor defaults

### Expose ports [Apache, Apache SSL, XDebug]
EXPOSE 80 443

### Set configrations
ADD conf/php.ini /etc/php/7.2/apache2/php.ini
ADD conf/xdebug.ini /etc/php/7.2/mods-available/xdebug.ini
ADD conf/supervisor.conf /etc/supervisor/conf.d/default.conf
ADD conf/apache2.conf /etc/apache2/apache2.conf

RUN rm -R /etc/apache2/sites-enabled/* /etc/apache2/sites-available/* /var/www/*
ADD conf/vhost.conf /etc/apache2/sites-enabled/host.conf

### Copy PHP project
COPY src /var/www

WORKDIR /var/www

### Base command (without overload)
ADD conf/entry.sh /etc/entry.sh
ENTRYPOINT ["/bin/bash", "/etc/entry.sh"]

### Base command (with overload)
#CMD some-command

