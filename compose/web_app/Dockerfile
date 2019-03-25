FROM php:7.2-apache

RUN apt-get update && \
    apt-get install -y \ 
    zip \
    git \
    zlib1g-dev \
    libicu-dev \
    g++ \
    mysql-client

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php composer-setup.php && \
    php -r "unlink('composer-setup.php');" && \
    mv composer.phar /usr/local/bin/composer

RUN docker-php-ext-configure intl && \
    docker-php-ext-configure pdo_mysql && \
    docker-php-ext-install intl && \
    docker-php-ext-install pdo_mysql && \
    a2enmod rewrite

COPY ./src/example/composer.json ./src/example/composer.lock /var/www/html/
RUN composer update && \ 
    composer install 

COPY ./compose/web_app/entrypoint.sh /entrypoint
RUN sed -i 's/\r//' /entrypoint && \
    chmod +x /entrypoint

ENTRYPOINT [ "/entrypoint" ]
CMD ["apache2-foreground"]