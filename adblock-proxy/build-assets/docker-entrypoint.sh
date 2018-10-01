#!/bin/sh
set -e

cp /etc/resolv.conf /etc/resolv.conf.dnsmasq
echo 'nameserver 127.0.0.1' > /etc/resolv.conf

iptables -A INPUT -p tcp --dport 443 -j REJECT

/usr/bin/supervisord -c /etc/supervisord.conf
