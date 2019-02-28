FROM richarvey/nginx-php-fpm:1.5.7

# INSTALL REDIS MODULE
RUN mkdir -p /usr/src/php/ext/redis && curl -L https://github.com/phpredis/phpredis/archive/4.2.0.tar.gz | tar xvz -C /usr/src/php/ext/redis --strip 1 && echo 'redis' >> /usr/src/php-available-exts && docker-php-ext-install redis
