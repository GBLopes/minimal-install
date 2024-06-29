#!/usr/bin/env bash

echo '
if [[ ":$PATH:" != *":/opt/zellij"* ]]; then
    export PATH="$PATH:/opt/zellij"
fi
' | tee -a "$HOME/.bashrc" && \

echo '
alias zj="zellij options --theme catppuccin-mocha"
' | tee -a "$HOME/.bashrc"
