#!/usr/bin/env bash

apt install -y picom && \

echo "${GREEN}Configurando inicialização automática do picom...${NC}" && \
if [ ! -f /etc/xdg/autostart/picom.desktop ]; then
    tee /etc/xdg/autostart/picom.desktop > /dev/null <<EOF
[Desktop Entry]
Type=Application
Name=Picom
Exec=picom --experimental-backends -b
StartupNotify=false
Terminal=false
Hidden=false
EOF

    echo "Picom adicionado à inicialização automática globalmente."
else
    echo "Picom já está configurado para inicialização automática globalmente."
fi