FROM alpine:3.8

EXPOSE 80
EXPOSE 443

ADD build-assets/docker-entrypoint.sh /docker-entrypoint.sh
ADD build-assets/nginx-selfoss.conf /etc/nginx/conf.d/selfoss.conf
ADD build-assets/supervisord.conf /etc/supervisord.conf

ADD https://github.com/SSilence/selfoss/releases/download/2.18/selfoss-2.18.zip /tmp/selfoss.zip

RUN chmod +x /docker-entrypoint.sh \
    && apk --no-cache add supervisor nginx openssl \
        php7 php7-curl php7-dom php7-fpm php7-gd php7-iconv php7-json php7-mbstring php7-pdo \
        php7-pdo_sqlite php7-session php7-sqlite3 php7-tidy php7-xml php7-xmlwriter \
    && mkdir -p /var/log/supervisor && mkdir -p /run/supervisor \
    && mkdir /run/nginx && mkdir /etc/nginx/certs && rm /etc/nginx/conf.d/default.conf \
    && mkdir /var/www/selfoss && unzip -d /var/www/selfoss /tmp/selfoss.zip && rm /tmp/selfoss.zip \
    && sed -i '/^user = nobody/s/nobody/nginx/g' /etc/php7/php-fpm.d/www.conf \
    && sed -i '/^group = nobody/s/nobody/www-data/g' /etc/php7/php-fpm.d/www.conf \
    && sed -i 's/; cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g' /etc/php7/php.ini

ENTRYPOINT ["/docker-entrypoint.sh"]