FROM alpine:3.8

EXPOSE 8888

ADD build-assets/docker-cmd.sh /docker-cmd.sh
ADD build-assets/dnsmasq-adblock.conf /etc/dnsmasq.d/adblock.conf
ADD build-assets/nginx-empty-gif.conf /etc/nginx/conf.d/empty-gif.conf
ADD build-assets/supervisord.conf /etc/supervisord.conf

RUN chmod +x /docker-cmd.sh \
    && apk --no-cache add supervisor dnsmasq tinyproxy nginx \
    && mkdir -p /var/log/supervisor && mkdir -p /run/supervisor \
    && mkdir /run/nginx && rm /etc/nginx/conf.d/default.conf \
    && sed -i '/^Allow 127.0.0.1/s/^/#/g' /etc/tinyproxy/tinyproxy.conf \
    && sed -i '/^#DisableViaHeader Yes/s/^#//g' /etc/tinyproxy/tinyproxy.conf \
    && echo 'resolv-file=/etc/resolv.conf.dnsmasq' >> /etc/dnsmasq.conf

CMD /docker-cmd.sh