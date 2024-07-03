#!/usr/bin/env bash

echo "${GREEN}Configurando ambiente xfce do usuário ${USER}...${NC}" && \
xfce4_dir="/home/$USER/.config/xfce4" && \
if [ ! -d "$xfce4_dir" ]; then
    echo "Pasta $xfce4_dir não existe para o usuário $USER, criando..."
    mkdir -p "$xfce4_dir"
fi && \
cp -R -f assets/configs/xfce4/* "$xfce4_dir" && \

gtk_dir="$HOME/.config/gtk-3.0" && \
if [ ! -d "$gtk_dir" ]; then
    echo "Pasta $gtk_dir não existe para o usuário $USER, criando..."
    mkdir -p "$gtk_dir"
fi && \
cp -R -f "assets/configs/gtk-3.0/*" "$gtk_dir"