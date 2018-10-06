FROM alpine:3.8
ENV POLIPO_VERSION=1.1.1

EXPOSE 8123

ADD build-assets/docker-entrypoint.sh /docker-entrypoint.sh
ADD build-assets/dnsmasq-adblock.conf /etc/dnsmasq.d/adblock.conf
ADD build-assets/nginx-empty-gif.conf /etc/nginx/conf.d/empty-gif.conf
ADD build-assets/supervisord.conf /etc/supervisord.conf

RUN chmod +x /docker-entrypoint.sh \
    && apk --no-cache add build-base texinfo supervisor dnsmasq nginx iptables \
    && wget https://github.com/jech/polipo/archive/polipo-${POLIPO_VERSION}.tar.gz -O - | tar xz -C /tmp/ \
        && cd /tmp/polipo-polipo-${POLIPO_VERSION} && make install \
    && apk del build-base && rm -rf /tmp/polipo-polipo-${POLIPO_VERSION} \
    && mkdir -p /var/log/supervisor && mkdir -p /run/supervisor \
    && mkdir /run/nginx && rm /etc/nginx/conf.d/default.conf \
    && echo 'resolv-file=/etc/resolv.conf.dnsmasq' >> /etc/dnsmasq.conf

ENTRYPOINT ["/docker-entrypoint.sh"]
