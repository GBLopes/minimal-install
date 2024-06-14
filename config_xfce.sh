#!/usr/bin/env bash

# Verifica se o usuário atual é root
if [ "$(id -u)" == "0" ]; then
    echo "Este script não pode ser executado como root."
    exit 1
fi && \


mkdir -p /home/$USER/.config/plank/dock1/launchers/ && \

cp -r utils/plank/*.dockitem /home/$USER/.config/plank/dock1/launchers && \

cp -r -f utils/configs/xfce4/* /home/$USER/.config/xfce4 && \

echo 'Configuração do ambiente xfce concluída!'