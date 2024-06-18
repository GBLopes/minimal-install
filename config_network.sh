#!/usr/bin/env bash

# Verifica se o usuário atual é root
if [ "$(id -u)" != "0" ]; then
    echo "Este script precisa ser executado como root. Por favor, execute-o com permissões de root."
    exit 1
fi && \

# WIFI / BLUETOOTH
apt install -y network-manager network-manager-gnome blueman && \
sed -i 's/managed=false/managed=true/g' /etc/NetworkManager/NetworkManager.conf && \
systemctl restart wpa_supplicant.service && \
systemctl restart NetworkManager