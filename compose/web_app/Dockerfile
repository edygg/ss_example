FROM php:7.2-apache

RUN apt-get update && \
    apt-get install -y zip git zlib1g-dev libicu-dev g++

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php composer-setup.php && \
    php -r "unlink('composer-setup.php');" && \
    mv composer.phar /usr/local/bin/composer

RUN docker-php-ext-configure intl && \
    docker-php-ext-install intl