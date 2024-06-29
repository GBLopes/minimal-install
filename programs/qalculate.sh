#!/usr/bin/env bash

curl -LO 'https://github.com/Qalculate/libqalculate/releases/download/v5.1.1/qalculate-5.1.1-x86_64.tar.xz' && \
tar -xvf qalculate-5.1.1-x86_64.tar.xz && rm qalculate-5.1.1-x86_64.tar.xz && \
mv qalculate-5.1.1 /opt && \
cp /assets/qalculate/qalculate.svg /usr/share/icons && \
cp /assets/qalculate/qalculate-gtk.desktop /usr/share/applications