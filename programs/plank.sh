#!/usr/bin/env bash

apt install -y plank && \

echo "${GREEN}Instalando tema WhiteSur em plank...${NC}" && \
cp -R WhiteSur-gtk-theme/src/other/plank/* /usr/share/plank/themes && \

echo "${GREEN}Configurando inicialização automática do plank...${NC}" && \
if [ ! -f /etc/xdg/autostart/plank.desktop ]; then
    tee /etc/xdg/autostart/plank.desktop > /dev/null <<EOF
[Desktop Entry]
Type=Application
Name=Plank
Exec=plank
StartupNotify=false
Terminal=false
Hidden=false
EOF

    echo "Plank adicionado à inicialização automática globalmente."
else
    echo "Plank já está configurado para inicialização automática globalmente."
fi && \

echo "${GREEN}Adicionando aplicações para uso na dock...${NC}" && \
cp -r utils/plank/*.desktop /usr/share/applications

# Configurar dock
# 	-> Copiar o conteúdo da pasta WhiteSur-gtk-theme/src/other/plank/ para ~/.local/share/plank/themes/
# 	-> plank --preferences
# 		-> Tema: theme-Dark
# 		-> Zoom do ícone: 130
# 		-> Docklets: add lixeira
# 	-> Add plank na inicialização (o comando pra iniciar é plank)