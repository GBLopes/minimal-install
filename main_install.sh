#!/usr/bin/env bash

# Verifica se o usuário atual é root
if [ "$(id -u)" != "0" ]; then
    echo "Este script precisa ser executado como root. Por favor, execute-o com permissões de root."
    exit 1
fi && \

GREEN='\033[0;32m' &&\
NC='\033[0m' && \

# Add sbin
echo "${GREEN}Atualizando .bashrc com sbin...${NC}" && \
./utils/add_sbin.sh && \

# Verifica se o diretório /opt existe
if [ ! -d "/opt" ]; then
    echo "${GREEN}Pasta /opt não existe, criando...${NC}"
    mkdir -p /opt
fi && \

# Desativa beep
echo "${GREEN}Desativando beep padrão...${NC}" && \
echo "blacklist pcspkr" | tee "/etc/modprobe.d/nobeep.conf" > /dev/null && \

# Atualiza sources.list
echo "${GREEN}Atualizando sources.list...${NC}" && \
sed -i 's/deb-src/#deb-src/g' /etc/apt/sources.list && \
sed -i 's/main/main contrib non-free/g' /etc/apt/sources.list && \

apt update && \

# bash-completion
echo "${GREEN}Instalando bash-completion...${NC}" && \
./programs/bash_completion.sh && \

# curl
echo "${GREEN}Instalando curl...${NC}" && \
./programs/curl.sh && \

# wget
echo "${GREEN}Instalando wget...${NC}" && \
./programs/wget.sh && \

# build-essential
echo "${GREEN}Instalando build-essential...${NC}" && \
./programs/build_essential.sh && \

# cmake
echo "${GREEN}Instalando cmake...${NC}" && \
./programs/cmake.sh && \

# ripgrep
echo "${GREEN}Instalando ripgrep...${NC}" && \
./programs/ripgrep.sh && \

# xclip
echo "${GREEN}Instalando xclip...${NC}" && \
./programs/xclip.sh && \

# zsh
echo "${GREEN}Instalando zsh...${NC}" && \
./programs/zsh.sh && \

# config zsh
echo "${GREEN}Configurando zsh...${NC}" && \
./utils/config_zsh.sh && \

# Jetbrains Mono Nerd Font
echo "${GREEN}Instalando JetBrainsMono Nerd Font...${NC}" && \
cp -r 'assets/fonts/JetBrainsMono Nerd Font' /usr/share/fonts && \

# MesloLGS
echo "${GREEN}Instalando MesloLGS NF...${NC}" && \
cp -r 'assets/fonts/MesloLGS NF' /usr/share/fonts && \

# Neovim
echo "${GREEN}Instalando Neovim...${NC}" && \
./programs/neovim.sh && \

# Add nvim
echo "${GREEN}Atualizando .bashrc com nvim...${NC}" && \
./utils/add_nvim.sh && \

# Habilitando alias em .bashrc
echo "${GREEN}Habilitando alias em .bashrc...${NC}" && \
sed -i 's/# export/export/g' "/root/.bashrc" && \
sed -i 's/# eval/eval/g' "/root/.bashrc" && \
sed -i 's/# alias/alias/g' "/root/.bashrc" && \

# xorg
echo "${GREEN}Instalando xorg...${NC}" && \
./programs/xorg.sh && \

# xfce
echo "${GREEN}Instalando xfce...${NC}" && \
./programs/xfce.sh && \

# ristretto
echo "${GREEN}Instalando ristretto...${NC}" && \
./programs/ristretto.sh && \

# zip
echo "${GREEN}Instalando zip...${NC}" && \
./programs/zip.sh && \

# unzip
echo "${GREEN}Instalando unzip...${NC}" && \
./programs/unzip.sh && \

# rar
echo "${GREEN}Instalando rar...${NC}" && \
./programs/rar.sh && \

# unrar
echo "${GREEN}Instalando unrar...${NC}" && \
./programs/unrar.sh && \

# gzip
echo "${GREEN}Instalando gzip...${NC}" && \
./programs/gzip.sh && \

# alacritty
echo "${GREEN}Instalando alacritty...${NC}" && \
./programs/alacritty.sh && \

# config alacritty
echo "${GREEN}Configurando alacritty...${NC}" && \
./utils/config_alacritty.sh && \

# firefox-esr
echo "${GREEN}Instalando firefox-esr...${NC}" && \
./programs/firefox_esr.sh && \

# brave
echo "${GREEN}Instalando brave...${NC}" && \
./programs/brave.sh && \

# gedit
echo "${GREEN}Instalando gedit...${NC}" && \
./programs/gedit.sh && \

# config gedit
echo "${GREEN}Configurando gedit...${NC}" && \
./utils/config_gedit.sh && \

# drawing
echo "${GREEN}Instalando drawing...${NC}" && \
./programs/drawing.sh && \

# gnome-clocks
echo "${GREEN}Instalando gnome-clocks...${NC}" && \
./programs/gnome_clocks.sh && \

# file-roller
echo "${GREEN}Instalando file-roller...${NC}" && \
./programs/file_roller.sh && \

# menulibre
echo "${GREEN}Instalando menulibre...${NC}" && \
./programs/menulibre.sh && \

# celluloid
echo "${GREEN}Instalando celluloid...${NC}" && \
./programs/celluloid.sh && \

# font-manager
echo "${GREEN}Instalando font-manager...${NC}" && \
./programs/font_manager.sh && \

# okular
echo "${GREEN}Instalando okular...${NC}" && \
./programs/okular.sh && \

# AppImage Launcher
echo "${GREEN}Instalando AppImage Launcher...${NC}" && \
./programs/appimage_launcher.sh && \

# Qalculate
echo "${GREEN}Instalando Qalculate...${NC}" && \
./programs/qalculate.sh && \

# LibreOffice
# echo "${GREEN}Instalando LibreOffice...${NC}" && \
# ./programs/libreoffice.sh && \

# OnlyOffice
echo "${GREEN}Instalando OnlyOffice...${NC}" && \
./programs/onlyoffice.sh && \

# ufw
echo "${GREEN}Instalando ufw...${NC}" && \
./programs/ufw.sh && \

# ttf-mscorefonts
echo "${GREEN}Instalando ttf-mscorefonts...${NC}" && \
./programs/ttf_mscorefonts.sh && \

# timeshift
echo "${GREEN}Instalando timeshift...${NC}" && \
./programs/timeshift.sh && \

# htop
echo "${GREEN}Instalando htop...${NC}" && \
./programs/htop.sh && \

# neofetch
echo "${GREEN}Instalando neofetch...${NC}" && \
./programs/neofetch.sh && \

# mugshot
echo "${GREEN}Instalando mugshot...${NC}" && \
./programs/mugshot.sh && \

# picom
echo "${GREEN}Instalando picom...${NC}" && \
./programs/picom.sh && \

# plank
echo "${GREEN}Instalando plank...${NC}" && \
./programs/plank.sh && \

# rclone
echo "${GREEN}Instalando rclone...${NC}" && \
./programs/rclone.sh && \

# Zellij
echo "${GREEN}Instalando Zellij...${NC}" && \
./programs/zellij.sh && \

# add zellij
echo "${GREEN}Atualizando .bashrc com zellij...${NC}" && \
./utils/add_zellij.sh && \

# vscode
echo "${GREEN}Instalando vscode...${NC}" && \
./programs/vscode.sh && \

# xterm
echo "${GREEN}Removendo xterm...${NC}" && \
apt remove -y xterm && \

# imagemagick
echo "${GREEN}Removendo imagemagick...${NC}" && \
apt remove -y imagemagick imagemagick-6-common imagemagick-6.q16 && \

#Rodar manualmente para configurar idioma do Chromium:
#dpkg-reconfigure locales && locale-gen

################################## TEMAS ##################################

# bigsur-setup
echo "${GREEN}Baixando bigsur-setup...${NC}" && \
./theme/bigsur_setup.sh && \

# fonts
echo "${GREEN}Atualizando fontes...${NC}" && \
cp -R update-xfce-bigsur/fonts/ "/usr/share/" && \

# wallpaper
echo "${GREEN}Atualizando wallpapers...${NC}" && \
cp -R update-xfce-bigsur/wallpapers/ "/usr/share/backgrounds/" && \

# WhiteSur-gtk-theme
echo "${GREEN}Instalando WhiteSur-gtk-theme...${NC}" && \
./theme/whitesur_gtk_theme.sh && \

# WhiteSur-icon-theme
echo "${GREEN}Instalando WhiteSur-icon-theme...${NC}" && \
./theme/whitesur_icon_theme.sh && \

# WhiteSur-cursors
echo "${GREEN}Instalando WhiteSur-cursors...${NC}" && \
./theme/whitesur_cursors.sh && \

# lightdm-gtk-greeter
echo "${GREEN}Configurando lightdm-gtk-greeter...${NC}" && \
cp -f utils/configs/lightdm-gtk-greeter.conf /etc/lightdm && \

#lightdm.conf
echo "${GREEN}Configurando lightdm.conf...${NC}" && \
sed -i 's/#greeter-hide-users=false/greeter-hide-users=false/' /etc/lightdm/lightdm.conf && \
sed -i 's/#allow-user-switching=true/allow-user-switching=true/' /etc/lightdm/lightdm.conf && \

# GRUB catppuccin theme
# echo "${GREEN}Configurando tema do grub...${NC}" && \
# ./programs/grub_theme.sh && \

echo 'INSTALAÇÃO CONCLUÍDA COM SUCESSO!'

# Configurar Aparência:
# 	-> Style: WhiteSur-Dark
# 	-> Icons: WhiteSur-dark
# 	-> Fonts:
# 		Padrão: San Francisco Display Regular 10 (Alt: San Francisco Text Regular 11)
# 		Mono: Iosevka Term Regular 10 (Alt: JetBrains Mono Regular 11)
# 		Habilitar suavização
# 		Hinting: Completo
# 		Ordem de subpixel: Nenhum
# 	-> Configurações:
# 		Mostrar imagens nos botões
# 		Mostrar imagens nos menus

# Window Manager:
# 	-> Tema: WhiteSur-Dark
# 	-> Fonte do título: San Francisco Display Medium 9 (Alt: San Francisco Text Medium 10)
# 	-> Alinhamento do título: Centro
# 	-> Botões ativos: Título, minimizar, ampliar, fechar

# Ordem dos itens no painel:
# 	-> Menu Whisker (start-icon)
# 	-> Separador
# 	-> Alternador de espaço de trabalho
# 	-> Separador (Expandir)
# 	-> Plug-in da bandeja de status
# 	-> Separador
# 	-> Atualização Meteorológica
# 	-> Separador
# 	-> Disposição do teclado
# 	-> Separador
# 	-> Wavelan
# 	-> Separador
# 	-> Plug-in do PulseAudio
# 	-> Separador
# 	-> Plug-in Gerenciador de energia
# 	-> Separador
# 	-> Plug-in de Notificações
# 	-> Separador
# 	-> Relógio (formato: %a, %d/%m/%Y   %H:%M) (font: San Francisco Text Medium 10)
# 	-> Separador
# 	-> Mostrar área de trabalho

# Alterar a aparência do gerenciador de áreas de trabalho
# 	-> No nome do espaço de trabalho, procurar o círculo da fonte JetBrains Mono no gerenciador de fontes, copiar e colar
# 	-> Aparência: Botões












