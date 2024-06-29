#!/usr/bin/env bash

# Verifica se o usuário atual é root
if [ "$(id -u)" != "0" ]; then
    echo "Este script precisa ser executado como root. Por favor, execute-o com permissões de root."
    exit 1
fi && \

GREEN='\033[0;32m' &&\
NC='\033[0m' && \

# WIFI / BLUETOOTH

# network-manager
echo "${GREEN}Instalando network-manager...${NC}" && \
apt install -y network-manager && \

# network-manager-gnome
echo "${GREEN}Instalando network-manager-gnome...${NC}" && \
apt install -y network-manager-gnome && \

# blueman
echo "${GREEN}Instalando blueman...${NC}" && \
apt install -y blueman && \

# config NetworkManager
echo "${GREEN}Configurando NetworkManager...${NC}" && \
sed -i 's/managed=false/managed=true/g' /etc/NetworkManager/NetworkManager.conf && \
systemctl restart wpa_supplicant.service && \
systemctl restart NetworkManager