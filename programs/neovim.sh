#!/usr/bin/env bash

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz && \
tar -C /opt -xzf nvim-linux64.tar.gz && \
rm nvim-linux64.tar.gz