#!/usr/bin/env bash

if [ ! -d "$HOME/.config/alacritty" ]; then
    echo "Criando pasta $HOME/.config/alacritty..."
    mkdir -p "$HOME/.config/alacritty"
fi && \
cp assets/configs/alacritty/alacritty.yml $HOME/.config/alacritty