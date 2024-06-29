#!/usr/bin/env bash

curl -LO 'https://github.com/TheAssassin/AppImageLauncher/releases/download/v2.2.0/appimagelauncher_2.2.0-travis995.0f91801.bionic_amd64.deb' && \
dpkg -i appimagelauncher_2.2.0-travis995.0f91801.bionic_amd64.deb && \
rm -f appimagelauncher_2.2.0-travis995.0f91801.bionic_amd64.deb