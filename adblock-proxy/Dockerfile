FROM alpine:3.8

EXPOSE 8888

ADD build-assets/docker-entrypoint.sh /docker-entrypoint.sh
ADD build-assets/dnsmasq-adblock.conf /etc/dnsmasq.d/adblock.conf
ADD build-assets/nginx-empty-gif.conf /etc/nginx/conf.d/empty-gif.conf
ADD build-assets/supervisord.conf /etc/supervisord.conf

RUN chmod +x /docker-entrypoint.sh \
    && apk --no-cache add supervisor dnsmasq tinyproxy nginx iptables \
    && mkdir -p /var/log/supervisor && mkdir -p /run/supervisor \
    && mkdir /run/nginx && rm /etc/nginx/conf.d/default.conf \
    && sed -i '/^Allow 127.0.0.1/s/^/#/' /etc/tinyproxy/tinyproxy.conf \
    && sed -i '/^#DisableViaHeader Yes/s/^#//' /etc/tinyproxy/tinyproxy.conf \
    && sed -i 's/^MinSpareServers [0-9][0-9]*$/MinSpareServers 80/' /etc/tinyproxy/tinyproxy.conf \
    && sed -i 's/^MaxSpareServers [0-9][0-9]*$/MaxSpareServers 100/' /etc/tinyproxy/tinyproxy.conf \
    && sed -i 's/^StartServers [0-9][0-9]*$/StartServers 100/' /etc/tinyproxy/tinyproxy.conf \
    && echo 'resolv-file=/etc/resolv.conf.dnsmasq' >> /etc/dnsmasq.conf

ENTRYPOINT ["/docker-entrypoint.sh"]
