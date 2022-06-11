FROM tozd/nginx-cron:ubuntu-focal

EXPOSE 80/tcp 443/tcp

VOLUME /var/log/dnsmasq
VOLUME /var/log/dockergen
VOLUME /var/log/letsencrypt
VOLUME /ssl

ENV DOCKER_HOST unix:///var/run/docker.sock
ENV LETSENCRYPT_EMAIL=

RUN apt-get update -q -q && \
 apt-get --yes --force-yes install software-properties-common && \
 add-apt-repository --yes universe && \
 apt-get  --yes --force-yes install wget ca-certificates dnsmasq 

RUN apt-get --yes --force-yes install python3-pip

RUN pip3 install certbot && \
 rm -f /etc/cron.d/certbot && \
 mkdir /dockergen

RUN wget -P /dockergen https://github.com/nginx-proxy/docker-gen/releases/download/0.9.0/docker-gen-linux-arm64-0.9.0.tar.gz && \
 tar xf /dockergen/docker-gen-linux-arm64-0.9.0.tar.gz -C /dockergen && \
 rm -f /dockergen/docker-gen-linux-amd64-0.9.0.tar.gz && \
 mkdir -p /ssl/letsencrypt

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ~/.cache ~/.npm

COPY ./etc /etc
COPY ./dockergen /dockergen
COPY ./letsencrypt-focal /letsencrypt
