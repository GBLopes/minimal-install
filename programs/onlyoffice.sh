#!/usr/bin/env bash

mkdir -p -m 700 ~/.gnupg && \
gpg --no-default-keyring --keyring gnupg-ring:/tmp/onlyoffice.gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys CB2DE8E5 && \
chmod 644 /tmp/onlyoffice.gpg && \
chown root:root /tmp/onlyoffice.gpg && \
mv /tmp/onlyoffice.gpg /usr/share/keyrings/onlyoffice.gpg && \

echo 'deb [signed-by=/usr/share/keyrings/onlyoffice.gpg] https://download.onlyoffice.com/repo/debian squeeze main' | tee -a /etc/apt/sources.list.d/onlyoffice.list && \

apt-get update && \

apt-get install -y onlyoffice-desktopeditors
