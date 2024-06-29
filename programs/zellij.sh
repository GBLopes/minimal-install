#!/usr/bin/env bash

curl -LO 'https://github.com/zellij-org/zellij/releases/download/v0.40.1/zellij-x86_64-unknown-linux-musl.tar.gz' && \
tar -xf 'zellij-x86_64-unknown-linux-musl.tar.gz' && \
rm zellij-x86_64-unknown-linux-musl.tar.gz && \
mkdir /opt/zellij && mv zellij /opt/zellij