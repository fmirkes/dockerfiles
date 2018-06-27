# znc
[IRC Bouncer](https://wiki.znc.in/ZNC)

Compared to the [official docker image](https://github.com/znc/znc-docker) this one installs znc from the alpine package repositories
to prevent unnecessary compile times during the build (e.g. on a RaspberryPi).

## Build
```
docker build -t znc .
```

## Run
Create the initial znc config
```
docker run -i -v <your znc data dir>:/znc znc --makeconf
```
Run the container
```
docker run -d --restart always -v <your znc data dir>:/znc znc
```
