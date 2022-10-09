FROM ubuntu:20.04

MAINTAINER sashaoshurkov <sashaoshurkov@gmail.com>

WORKDIR /root

RUN apt-get update  && \
        apt-get -y install wget libappindicator3-1 libpcap0.8 && \
        wget https://github.com/getlantern/lantern-binaries/raw/main/lantern-installer-64-bit.deb && \
        dpkg -i lantern-installer-64-bit.deb && \
        rm -rf lantern-installer-64-bit.deb && \
        apt-get -f install && \
        apt-get clean && \
        rm -rf /var/cache/apt/* /var/lib/apt/lists/* && \
        mkdir /root/.lantern && \
        echo "localHTTPToken: admin" > /root/settings.yaml

EXPOSE 3128/tcp 8080/tcp

ENTRYPOINT ["/usr/bin/lantern", "--configdir=/root", "--headless=true", "--proxyall=true", "--startup=false", "--clear-proxy-settings=false", "--addr=0.0.0.0:3128", "--uiaddr=0.0.0.0:8080"]
