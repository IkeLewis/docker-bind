[![Build Status](https://travis-ci.org/IkeLewis/docker-bind.svg?branch=master)](https://travis-ci.org/IkeLewis/docker-bind)

docker-bind
===========

Dockerize bind9 (https://www.isc.org/downloads/bind) with dnsutils.

Installation (via Docker Hub)
-----------------------------

```
$ docker pull ikelewis/bind9
```

Default Configuration
---------------------

The only major difference between a standard installation of bind9 and
this installation is that logging is already configured for you in a
docker-friendly way; to the best of my knowledge the default logging
location for Debian's bind9 is /var/log/syslog.  In contrast,
docker-bind combines all logging output and then sends it to standard
output so that you may take advantage of 'docker logs' for better log
management.

Command line Usage
------------------

Start a caching DNS server on the default docker network.

```
$ docker run --rm -itd --name bind-dns-server ikelewis/docker-bind
```

Easily view the logging output.

```
$ docker logs bind-dns-server

+ service bind9 start
[....] Starting domain name service...: bind9 [ok]
+ cd /var/log/bind/
+ tail -f access.log update.log security.log
==> access.log <==
19-Jul-2017 23:45:10.047 general: info: managed-keys-zone: loaded serial 1
19-Jul-2017 23:45:10.047 general: info: zone 0.in-addr.arpa/IN: loaded serial 1
19-Jul-2017 23:45:10.053 general: info: zone 255.in-addr.arpa/IN: loaded serial 1
19-Jul-2017 23:45:10.053 general: info: zone 127.in-addr.arpa/IN: loaded serial 1
19-Jul-2017 23:45:10.054 general: info: zone localhost/IN: loaded serial 2
19-Jul-2017 23:45:10.054 general: notice: all zones loaded
19-Jul-2017 23:45:10.055 general: notice: running

==> update.log <==

==> security.log <==

==> access.log <==
19-Jul-2017 23:45:20.055 general: warning: managed-keys-zone: Unable to fetch DNSKEY set '.': timed out
```

Removal
-------

```
$ docker rmi ikelewis/docker-bind
```