# BUILD: docker build -t debian-bind .

# RUN: docker run --rm -itd --name debian-bind debian-bind

FROM debian

ADD named.conf.log /etc/bind/
ADD docker-entrypoint.sh /

RUN apt-get update && \
    apt-get -y install dnsutils bind9 && \
    echo "include \"/etc/bind/named.conf.log\";" >> /etc/bind/named.conf && \
    mkdir -p /var/log/bind && \
    cd /var/log/bind && \
    touch access.log security.log update.log && \
    chgrp -R bind . && \
    chmod -R g=+rwX . && \
    rm -r /var/lib/apt/lists/*

EXPOSE 53

ENTRYPOINT ["/docker-entrypoint.sh"]
