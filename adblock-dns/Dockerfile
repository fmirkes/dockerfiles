FROM alpine:latest

ENV NULL_HOST=0.0.0.0

EXPOSE 53

RUN apk --no-cache add ca-certificates dnsmasq python

COPY build-assets/create-dnsmasq-adblock-conf.py /usr/local/bin/create-dnsmasq-adblock-conf
RUN chmod +x /usr/local/bin/create-dnsmasq-adblock-conf

COPY build-assets/docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
