# adblock-dns
Blocks ads with the help of [dnsmasq](http://www.thekelleys.org.uk/dnsmasq/doc.html)

## Build
```
docker build -t adblock-dns .
```

## Run
```
docker run --cap-add=NET_ADMIN -p 53:53 adblock-dns

# set the ip for resolved ad host names
docker run --cap-add=NET_ADMIN -e NULL_HOST=127.0.0.1 -p 53:53 adblock-dns
```
