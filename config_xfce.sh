#!/usr/bin/env bash

# Verifica se o usuário atual é root
if [ "$(id -u)" == "0" ]; then
    echo "Este script não pode ser executado como root."
    exit 1
fi && \

chmod 755 /home/$USER && \

echo '
if [[ ":$PATH:" != *":/sbin"* ]]; then
    export PATH="$PATH:/sbin"
fi
' | tee -a "$HOME/.bashrc" && \

echo '
if [[ ":$PATH:" != *":/usr/sbin"* ]]; then
    export PATH="$PATH:/usr/sbin"
fi
' | tee -a "$HOME/.bashrc" && \

echo '
if [[ ":$PATH:" != *":/opt/nvim-linux64/bin"* ]]; then
    export PATH="$PATH:/opt/nvim-linux64/bin"
fi
' | tee -a "$HOME/.bashrc" && \

echo '
if [[ ":$PATH:" != *":/opt/zellij"* ]]; then
    export PATH="$PATH:/opt/zellij"
fi
' | tee -a "$HOME/.bashrc" && \

sed -i 's/#shopt/shopt/g' "$HOME/.bashrc" && \
sed -i 's/#\[/\[/g' "$HOME/.bashrc" && \
sed -i 's/#force_color/force_color/g' "$HOME/.bashrc" && \
sed -i 's/#alias/alias/g' "$HOME/.bashrc" && \
sed -i 's/#export/export/g' "$HOME/.bashrc" && \

source '/root/.bashrc' && \

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

# Helix
#curl -LO 'https://github.com/helix-editor/helix/releases/download/24.03/helix-24.03-x86_64.AppImage' && \
#chmod +x helix-24.03-x86_64.AppImage && \
#mv helix-24.03-x86_64.AppImage $HOME/Applications/ && \

# VSCodium
curl -LO 'https://github.com/VSCodium/vscodium/releases/download/1.90.1.24165/VSCodium-1.90.1.24165.glibc2.18-x86_64.AppImage' && \
mv 'VSCodium-1.90.1.24165.glibc2.18-x86_64.AppImage' $HOME/Applications && \

# ZSH
cp utils/.zshrc $HOME/.zshrc && \
chsh -s /bin/zsh && \
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k && \

#Kickstart Neovim
git clone https://github.com/nvim-lua/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim && \

# Alacritty Catpuccin theme
if [ ! -d "$HOME/.config/alacritty" ]; then
    echo "Criando pasta $HOME/.config/alacritty..."
    mkdir -p "$HOME/.config/alacritty"
fi && \
cp utils/configs/alacritty/alacritty.yml $HOME/.config/alacritty && \

#Gedit Catpuccin theme
git clone https://github.com/catppuccin/gedit.git && \
cd gedit && \
./install.sh && \

echo 'Configuração do ambiente xfce concluída!'
