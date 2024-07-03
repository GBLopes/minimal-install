#!/usr/bin/env bash

echo '
if [[ ":$PATH:" != *":/sbin"* ]]; then
    export PATH="$PATH:/sbin"
fi
' | tee -a "$HOME/.bashrc" && \

echo '
if [[ ":$PATH:" != *":/usr/sbin"* ]]; then
    export PATH="$PATH:/usr/sbin"
fi
' | tee -a "$HOME/.bashrc" && \

source "$HOME/.bashrc"