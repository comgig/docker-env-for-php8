FROM php:8.1.5-fpm-buster
RUN docker-php-ext-install bcmath
RUN docker-php-ext-install pdo_mysql
RUN apt-get update
RUN apt-get install -y git zip unzip
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - 
RUN apt-get install -y nodejs
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
WORKDIR /var/www
EXPOSE 9000