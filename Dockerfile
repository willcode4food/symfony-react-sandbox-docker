FROM php:7-apache
ADD apache2.conf /etc/apache2/apache2.conf
ADD 000-default.conf /etc/apache2/sites-available/000-default.conf
ADD symfony.ini /usr/local/etc/php/conf.d/symfony.ini

RUN apt-get update \
        && apt-get install -y libicu-dev \
        && apt-get install -y git \
        && apt-get install -y zip \
        && apt-get clean \
        && rm -rf /var/lib/apt/lists/*

RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer

RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - \
	&& apt-get install -y nodejs

RUN docker-php-ext-install pdo pdo_mysql opcache intl && a2enmod rewrite && mkdir /var/www/html/web

RUN npm install -g webpack webpack-dev-server ntl