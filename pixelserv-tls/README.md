# pixelserv-tls
[pixelserv-tls](https://github.com/kvic-z/pixelserv-tls)

## Build
```
docker build -t pixelserv-tls .
```

## Run
```
docker run -p 80:80 -p 443:443 pixelserv-tls
```

### Persist ca certificate
```
cd /your/vol
openssl genrsa -out ca.key 1024
openssl req -key ca.key -new -x509 -days 3650 -sha256 -extensions v3_ca -out ca.crt -subj "/CN=Pixelserv CA"

docker run -p 80:80 -p 443:443 -v /your/vol:/var/cache/pixelserv pixelserv-tls
```
