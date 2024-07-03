#!/usr/bin/env bash

# Verifica se o usuário atual é root
if [ "$(id -u)" == "0" ]; then
    echo "Este script não pode ser executado como root."
    exit 1
fi && \

GREEN='\033[0;32m' &&\
NC='\033[0m' && \

echo -e "${GREEN}Atualizando permissões da pasta do usuário ${USER}...${NC}" && \
chmod 755 /home/$USER && \

# Add sbin
echo -e "${GREEN}Atualizando .bashrc do usuário ${USER} com sbin...${NC}" && \
./utils/add_sbin.sh && \

# Add nvim
echo -e "${GREEN}Atualizando .bashrc do usuário ${USER} com nvim...${NC}" && \
./utils/add_nvim.sh && \

# Add zellij
echo -e "${GREEN}Atualizando .bashrc do usuário ${USER} com zellij...${NC}" && \
./utils/add_zellij.sh && \

# Habilitando alias em .bashrc
echo -e "${GREEN}Habilitando alias em .bashrc do usuário ${USER}...${NC}" && \
sed -i 's/#shopt/shopt/g' "$HOME/.bashrc" && \
sed -i 's/#\[/\[/g' "$HOME/.bashrc" && \
sed -i 's/#force_color/force_color/g' "$HOME/.bashrc" && \
sed -i 's/#alias/alias/g' "$HOME/.bashrc" && \
sed -i 's/#export/export/g' "$HOME/.bashrc" && \

source "$HOME/.bashrc" && \

# Add lançadores plank
echo -e "${GREEN}Adicionando lançadores na dock do usuário ${USER}...${NC}" && \
mkdir -p "/home/$USER/.config/plank/dock1/launchers/" && \
cp -R -f assets/plank/*.dockitem "/home/$USER/.config/plank/dock1/launchers" && \

# config xfce
echo -e "${GREEN}Configurando ambiente xfce do usuário ${USER}...${NC}" && \
./utils/config_xfce.sh && \

# config picom
# echo -e "${GREEN}Configurando picom do usuário ${USER}...${NC}" && \
# ./utils/config_picom.sh && \

# Pasta Applications
if [ ! -d "$HOME/Applications" ]; then
    echo "Pasta Applications não existe para o usuário $USER, criando..."
    mkdir -p "$HOME/Applications"
fi && \

# config zsh
echo -e "${GREEN}Configurando zsh do usuário ${USER}...${NC}" && \
./utils/config_zsh.sh && \

# config alacritty
echo -e "${GREEN}Configurando alacritty do usuário ${USER}...${NC}" && \
./utils/config_alacritty.sh && \

# config gedit
echo -e "${GREEN}Configurando gedit do usuário ${USER}...${NC}" && \
./utils/config_gedit.sh && \

echo "Configuração do usuário ${USER} concluída!"

# Helix
#curl -LO 'https://github.com/helix-editor/helix/releases/download/24.03/helix-24.03-x86_64.AppImage' && \
#chmod +x helix-24.03-x86_64.AppImage && \
#mv helix-24.03-x86_64.AppImage $HOME/Applications/ && \

# VSCodium
#curl -LO 'https://github.com/VSCodium/vscodium/releases/download/1.90.1.24165/VSCodium-1.90.1.24165.glibc2.18-x86_64.AppImage' && \
#mv 'VSCodium-1.90.1.24165.glibc2.18-x86_64.AppImage' $HOME/Applications && \
