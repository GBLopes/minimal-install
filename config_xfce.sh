#!/usr/bin/env bash

# Verifica se o usuário atual é root
if [ "$(id -u)" == "0" ]; then
    echo "Este script não pode ser executado como root."
    exit 1
fi && \

chmod 755 /home/$USER && \

mkdir -p "/home/$USER/.config/plank/dock1/launchers/" && \

cp -R -f utils/plank/*.dockitem "/home/$USER/.config/plank/dock1/launchers" && \

# Verifica se o diretório ~/.config/xfce4 existe para o usuário atual
xfce4_dir="/home/$USER/.config/xfce4" && \

if [ ! -d "$xfce4_dir" ]; then
    echo "Pasta $xfce4_dir não existe para o usuário $USER, criando..."
    mkdir -p "$xfce4_dir"
fi && \

cp -R -f utils/configs/xfce4/* "$xfce4_dir" && \

mkdir "/home/$USER/.config/picom" && \

cp utils/configs/picom/picom.conf "/home/$USER/.config/picom" && \

if [ ! -d "$HOME/Applications" ]; then
    echo "Pasta Applications não existe para o usuário $USER, criando..."
    mkdir -p "$HOME/Applications"
fi && \

echo 'Configuração do ambiente xfce concluída!'
