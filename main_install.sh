#!/usr/bin/env bash

# Verifica se o usuário atual é root
if [ "$(id -u)" != "0" ]; then
    echo "Este script precisa ser executado como root. Por favor, execute-o com permissões de root."
    exit 1
fi && \

GREEN='\033[0;32m' &&\
NC='\033[0m' && \

# Add sbin
echo -e "${GREEN}Atualizando .bashrc com sbin...${NC}" && \
./utils/add_sbin.sh && \

# Verifica se o diretório /opt existe
if [ ! -d "/opt" ]; then
    echo -e "${GREEN}Pasta /opt não existe, criando...${NC}"
    mkdir -p /opt
fi && \

# Desativa beep
echo -e "${GREEN}Desativando beep padrão...${NC}" && \
echo "blacklist pcspkr" | tee "/etc/modprobe.d/nobeep.conf" > /dev/null && \

# Atualiza sources.list
echo -e "${GREEN}Atualizando sources.list...${NC}" && \
sed -i 's/deb-src/#deb-src/g' /etc/apt/sources.list && \
sed -i 's/main/main contrib non-free/g' /etc/apt/sources.list && \

apt update && \

# bash-completion
echo -e "${GREEN}Instalando bash-completion...${NC}" && \
./programs/bash_completion.sh && \

# curl
echo -e "${GREEN}Instalando curl...${NC}" && \
./programs/curl.sh && \

# wget
echo -e "${GREEN}Instalando wget...${NC}" && \
./programs/wget.sh && \

# build-essential
echo -e "${GREEN}Instalando build-essential...${NC}" && \
./programs/build_essential.sh && \

# cmake
echo -e "${GREEN}Instalando cmake...${NC}" && \
./programs/cmake.sh && \

# ripgrep
echo -e "${GREEN}Instalando ripgrep...${NC}" && \
./programs/ripgrep.sh && \

# xclip
echo -e "${GREEN}Instalando xclip...${NC}" && \
./programs/xclip.sh && \

# zsh
echo -e "${GREEN}Instalando zsh...${NC}" && \
./programs/zsh.sh && \

# config zsh
echo -e "${GREEN}Configurando zsh...${NC}" && \
./utils/config_zsh.sh && \

# Jetbrains Mono Nerd Font
echo -e "${GREEN}Instalando JetBrainsMono Nerd Font...${NC}" && \
cp -r 'assets/fonts/JetBrainsMono Nerd Font' /usr/share/fonts && \

# MesloLGS
echo -e "${GREEN}Instalando MesloLGS NF...${NC}" && \
cp -r 'assets/fonts/MesloLGS NF' /usr/share/fonts && \

# Neovim
echo -e "${GREEN}Instalando Neovim...${NC}" && \
./programs/neovim.sh && \

# Add nvim
echo -e "${GREEN}Atualizando .bashrc com nvim...${NC}" && \
./utils/add_nvim.sh && \

# Habilitando alias em .bashrc
echo -e "${GREEN}Habilitando alias em .bashrc...${NC}" && \
sed -i 's/# export/export/g' "/root/.bashrc" && \
sed -i 's/# eval/eval/g' "/root/.bashrc" && \
sed -i 's/# alias/alias/g' "/root/.bashrc" && \

# xorg
echo -e "${GREEN}Instalando xorg...${NC}" && \
./programs/xorg.sh && \

# xfce
echo -e "${GREEN}Instalando xfce...${NC}" && \
./programs/xfce.sh && \

# ristretto
echo -e "${GREEN}Instalando ristretto...${NC}" && \
./programs/ristretto.sh && \

# zip
echo -e "${GREEN}Instalando zip...${NC}" && \
./programs/zip.sh && \

# unzip
echo -e "${GREEN}Instalando unzip...${NC}" && \
./programs/unzip.sh && \

# rar
echo -e "${GREEN}Instalando rar...${NC}" && \
./programs/rar.sh && \

# unrar
echo -e "${GREEN}Instalando unrar...${NC}" && \
./programs/unrar.sh && \

# gzip
echo -e "${GREEN}Instalando gzip...${NC}" && \
./programs/gzip.sh && \

# alacritty
echo -e "${GREEN}Instalando alacritty...${NC}" && \
./programs/alacritty.sh && \

# config alacritty
echo -e "${GREEN}Configurando alacritty...${NC}" && \
./utils/config_alacritty.sh && \

# firefox-esr
echo -e "${GREEN}Instalando firefox-esr...${NC}" && \
./programs/firefox_esr.sh && \

# brave
echo -e "${GREEN}Instalando brave...${NC}" && \
./programs/brave.sh && \

# gedit
echo -e "${GREEN}Instalando gedit...${NC}" && \
./programs/gedit.sh && \

# config gedit
echo -e "${GREEN}Configurando gedit...${NC}" && \
./utils/config_gedit.sh && \

# drawing
echo -e "${GREEN}Instalando drawing...${NC}" && \
./programs/drawing.sh && \

# gnome-clocks
echo -e "${GREEN}Instalando gnome-clocks...${NC}" && \
./programs/gnome_clocks.sh && \

# file-roller
echo -e "${GREEN}Instalando file-roller...${NC}" && \
./programs/file_roller.sh && \

# menulibre
echo -e "${GREEN}Instalando menulibre...${NC}" && \
./programs/menulibre.sh && \

# celluloid
echo -e "${GREEN}Instalando celluloid...${NC}" && \
./programs/celluloid.sh && \

# font-manager
echo -e "${GREEN}Instalando font-manager...${NC}" && \
./programs/font_manager.sh && \

# okular
echo -e "${GREEN}Instalando okular...${NC}" && \
./programs/okular.sh && \

# AppImage Launcher
echo -e "${GREEN}Instalando AppImage Launcher...${NC}" && \
./programs/appimage_launcher.sh && \

# Qalculate
echo -e "${GREEN}Instalando Qalculate...${NC}" && \
./programs/qalculate.sh && \

# LibreOffice
# echo -e "${GREEN}Instalando LibreOffice...${NC}" && \
# ./programs/libreoffice.sh && \

# OnlyOffice
echo -e "${GREEN}Instalando OnlyOffice...${NC}" && \
./programs/onlyoffice.sh && \

# ufw
echo -e "${GREEN}Instalando ufw...${NC}" && \
./programs/ufw.sh && \

# ttf-mscorefonts
echo -e "${GREEN}Instalando ttf-mscorefonts...${NC}" && \
./programs/ttf_mscorefonts.sh && \

# timeshift
echo -e "${GREEN}Instalando timeshift...${NC}" && \
./programs/timeshift.sh && \

# htop
echo -e "${GREEN}Instalando htop...${NC}" && \
./programs/htop.sh && \

# neofetch
echo -e "${GREEN}Instalando neofetch...${NC}" && \
./programs/neofetch.sh && \

# mugshot
echo -e "${GREEN}Instalando mugshot...${NC}" && \
./programs/mugshot.sh && \

# picom
echo -e "${GREEN}Instalando picom...${NC}" && \
./programs/picom.sh && \

# rclone
echo -e "${GREEN}Instalando rclone...${NC}" && \
./programs/rclone.sh && \

# Zellij
echo -e "${GREEN}Instalando Zellij...${NC}" && \
./programs/zellij.sh && \

# add zellij
echo -e "${GREEN}Atualizando .bashrc com zellij...${NC}" && \
./utils/add_zellij.sh && \

# vscode
echo -e "${GREEN}Instalando vscode...${NC}" && \
./programs/vscode.sh && \

# xterm
echo -e "${GREEN}Removendo xterm...${NC}" && \
apt remove -y xterm && \

# imagemagick
echo -e "${GREEN}Removendo imagemagick...${NC}" && \
apt remove -y imagemagick imagemagick-6-common imagemagick-6.q16 && \

#Rodar manualmente para configurar idioma do Chromium:
#dpkg-reconfigure locales && locale-gen

################################## TEMAS ##################################

# bigsur-setup
echo -e "${GREEN}Baixando bigsur-setup...${NC}" && \
./theme/bigsur_setup.sh && \

# fonts
echo -e "${GREEN}Atualizando fontes...${NC}" && \
cp -R update-xfce-bigsur/fonts/ "/usr/share/" && \

# wallpaper
echo -e "${GREEN}Atualizando wallpapers...${NC}" && \
cp -R update-xfce-bigsur/wallpapers/ "/usr/share/backgrounds/" && \

# WhiteSur-gtk-theme
echo -e "${GREEN}Instalando WhiteSur-gtk-theme...${NC}" && \
./theme/whitesur_gtk_theme.sh && \

# WhiteSur-icon-theme
echo -e "${GREEN}Instalando WhiteSur-icon-theme...${NC}" && \
./theme/whitesur_icon_theme.sh && \

# WhiteSur-cursors
echo -e "${GREEN}Instalando WhiteSur-cursors...${NC}" && \
./theme/whitesur_cursors.sh && \

# plank
echo -e "${GREEN}Instalando plank...${NC}" && \
./programs/plank.sh && \

# lightdm-gtk-greeter
echo -e "${GREEN}Configurando lightdm-gtk-greeter...${NC}" && \
cp -f utils/configs/lightdm-gtk-greeter.conf /etc/lightdm && \

#lightdm.conf
echo -e "${GREEN}Configurando lightdm.conf...${NC}" && \
sed -i 's/#greeter-hide-users=false/greeter-hide-users=false/' /etc/lightdm/lightdm.conf && \
sed -i 's/#allow-user-switching=true/allow-user-switching=true/' /etc/lightdm/lightdm.conf && \

# GRUB catppuccin theme
# echo -e "${GREEN}Configurando tema do grub...${NC}" && \
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












