#!/usr/bin/env bash

echo '
if [[ ":$PATH:" != *":/opt/nvim-linux64/bin"* ]]; then
    export PATH="$PATH:/opt/nvim-linux64/bin"
fi
' | tee -a "$HOME/.bashrc" && \

#Kickstart Neovim
git clone https://github.com/nvim-lua/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim