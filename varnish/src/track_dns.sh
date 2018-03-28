#!/bin/bash

source /etc/environment

IPS_1=`cat /etc/varnish/dns.backends`
python3 /add_backends.py dns
IPS_2=`cat /etc/varnish/dns.backends`

if [ "$IPS_1" != "$IPS_2" ]; then
  echo "DNS backends changed: $IPS_2"
  reload
fi
