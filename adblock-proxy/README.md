# adblock-proxy
Blocks ads with the help of [dnsmasq](http://www.thekelleys.org.uk/dnsmasq/doc.html), [nginx](https://www.nginx.com/) and [polipo](https://www.irif.fr/~jch/software/polipo/).
Tested on a Raspberry Pi.

## Build
```
./create-dnsmasq-adblock.conf.py
docker build -t adblock-proxy .
```

## Run
```
docker run --cap-add=NET_ADMIN --cap-add=NET_RAW -d -p 8123:8123 adblock-proxy
```
Point your browsers http/https proxy to *\<docker-host\>:8123*.
