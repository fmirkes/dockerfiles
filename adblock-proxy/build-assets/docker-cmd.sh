#!/bin/sh
set -e

cp /etc/resolv.conf /etc/resolv.conf.dnsmasq
echo 'nameserver 127.0.0.1' > /etc/resolv.conf

/usr/bin/supervisord -c /etc/supervisord.conf