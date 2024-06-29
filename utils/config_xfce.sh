#!/usr/bin/env bash

echo "${GREEN}Configurando ambiente xfce do usuário ${USER}...${NC}" && \
xfce4_dir="/home/$USER/.config/xfce4" && \
if [ ! -d "$xfce4_dir" ]; then
    echo "Pasta $xfce4_dir não existe para o usuário $USER, criando..."
    mkdir -p "$xfce4_dir"
fi && \
cp -R -f assets/configs/xfce4/* "$xfce4_dir"