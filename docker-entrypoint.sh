#!/bin/bash -ex

service bind9 start
cd /var/log/bind/
tail -f access.log update.log security.log
