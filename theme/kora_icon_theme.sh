#!/usr/bin/env bash

git clone https://github.com/bikass/kora.git && \
cp -R -f kora/kora /usr/share/icons && \
cp -R -f kora/kora-light /usr/share/icons && \
cp -R -f kora/kora-light-panel /usr/share/icons && \
cp -R -f kora/kora-pgrey /usr/share/icons && \
rm -rf kora