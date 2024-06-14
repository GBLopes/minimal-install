#!/usr/bin/env bash

# Verifica se o usuário atual é root
if [ "$(id -u)" == "0" ]; then
    echo "Este script não pode ser executado como root."
    exit 1
fi && \

chmod 755 /home/$USER && \

mkdir -p "/home/$USER/.config/plank/dock1/launchers/" && \

cp -R -f utils/plank/*.dockitem "/home/$USER/.config/plank/dock1/launchers" && \

cp -R -f utils/configs/xfce4/* "/home/$USER/.config/xfce4" && \

mkdir "/home/$USER/.config/picom" && \

cp update-xfce-bigsur/picom/picom.conf "/home/$USER/.config/picom" && \

# Arquivo picom.conf
picom_conf="/home/$USER/.config/picom/picom.conf" && \

# Comentar linhas específicas
sed -i 's/^inactive-opacity = 0.8/#inactive-opacity = 0.8/' "$picom_conf" && \
sed -i 's/^frame-opacity = 0.7/#frame-opacity = 0.7/' "$picom_conf" && \
sed -i 's/popup_menu = { opacity = 0.8; }/#popup_menu = { opacity = 0.8; }/' "$picom_conf" && \
sed -i 's/dropdown_menu = { opacity = 0.8; }/#dropdown_menu = { opacity = 0.8; }/' "$picom_conf" && \

echo 'Configuração do ambiente xfce concluída!'