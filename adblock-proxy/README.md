# adblock-proxy
Blocks ads with the help of [dnsmasq](http://www.thekelleys.org.uk/dnsmasq/doc.html), [nginx](https://www.nginx.com/) and [tinyproxy](https://tinyproxy.github.io/).
Tested on a Raspberry Pi.

## Build
```
./create-dnsmasq-adblock.conf.py
docker build -t adblock-proxy .
```

## Run
```
docker run --cap-add=NET_ADMIN --cap-add=NET_RAW -d -p 8888:8888 adblock-proxy
```
Point your browsers http/https proxy to *\<docker-host\>:8888*.
