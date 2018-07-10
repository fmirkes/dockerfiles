#!/bin/sh
set -e

chown -R znc:znc /znc
chmod -R 700 /znc

su - znc  -s /bin/sh -c "/usr/bin/znc --foreground --datadir /znc ${@}"
