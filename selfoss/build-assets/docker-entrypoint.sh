#!/bin/sh
set -eu

for _DATA_DIR in "data/cache" "data/favicons" "data/fulltextrss" "data/logs" "data/sqlite" "data/thumbnails" "data/thumbnails" "public"; do
    mkdir -p "/var/www/selfoss/${_DATA_DIR}"
    chown -R nginx:www-data "/var/www/selfoss/${_DATA_DIR}"
    chmod 770 "/var/www/selfoss/${_DATA_DIR}"
done
unset _DATA_DIR

[ -f /var/www/selfoss/config.ini ] && chown nginx:www-data /var/www/selfoss/config.ini && chmod 770 /var/www/selfoss/config.ini

if [ ! -f /etc/nginx/certs/selfoss.key ] && [ ! -f /etc/nginx/certs/selfoss.crt ]; then
    echo "No ssl certificates found. Generating..."
    openssl req -x509 -nodes -days 3650 -newkey rsa:1024 -keyout /etc/nginx/certs/selfoss.key -out /etc/nginx/certs/selfoss.crt -subj /CN=selfoss.docker
fi

/usr/bin/supervisord -c /etc/supervisord.conf