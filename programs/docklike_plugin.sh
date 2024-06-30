#!/usr/bin/env bash

echo "deb https://ppa.launchpadcontent.net/xubuntu-dev/extras/ubuntu jammy main" > /etc/apt/sources.list.d/docklike.list && \

apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EB563F93142986CE && \

apt update && \

apt install -y xfce4-docklike-plugin
