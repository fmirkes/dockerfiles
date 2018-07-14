# selfoss
[RSS/News Reader](https://selfoss.aditu.de) based on PHP

Provided by nginx and php-fpm7

## Build
```
docker build -t selfoss .
```

## Run
```
docker run -d -p 80:80 -p 443:443 -v <your config>:/var/www/selfoss/config.ini <your data dir>:/var/www/selfoss/data selfoss
```

### SSL
The container looks for a ssl keypair at */etc/nginx/certs/selfoss.crt* and */etc/nginx/certs/selfoss.key*.
If they are missing, it generates a self-signed one at start.