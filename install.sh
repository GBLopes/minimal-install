#!/usr/bin/env bash

# Verifica se o usuário atual é root
if [ "$(id -u)" != "0" ]; then
    echo "Este script precisa ser executado como root. Por favor, execute-o com permissões de root."
    exit 1
fi && \

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

source '/root/.bashrc' && \

# Verifica se o diretório /opt existe
if [ ! -d "/opt" ]; then
    echo "Pasta /opt não existe, criando..."
    mkdir -p /opt
fi && \

# Desativar beep
echo "blacklist pcspkr" | tee "/etc/modprobe.d/nobeep.conf" > /dev/null && \

# Update sources list
sed -i 's/deb-src/#deb-src/g' /etc/apt/sources.list && \
sed -i 's/main/main contrib non-free/g' /etc/apt/sources.list && \

apt update && apt install -y bash-completion curl build-essential cmake && \

# Zsh
apt install -y zsh zplug ripgrep xclip && \
cp -r 'utils/fonts/MesloLGS NF' /usr/share/fonts && \
cp -r 'utils/fonts/JetBrainsMono Nerd Font' /usr/share/fonts && \

# Neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz && \
tar -C /opt -xzf nvim-linux64.tar.gz && \
rm nvim-linux64.tar.gz && \
echo '
if [[ ":$PATH:" != *":/opt/nvim-linux64/bin"* ]]; then
    export PATH="$PATH:/opt/nvim-linux64/bin"
fi
' | tee -a "$HOME/.bashrc" && \

#Kickstart Neovim
git clone https://github.com/nvim-lua/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim && \

sed -i 's/# export/export/g' "/root/.bashrc" && \
sed -i 's/# eval/eval/g' "/root/.bashrc" && \
sed -i 's/# alias/alias/g' "/root/.bashrc" && \

echo 'source /etc/bash_completion' >> "/root/.bashrc" && \

apt install -y xorg && \

apt install -y xfce4 && \

apt install -y xfce4-battery-plugin xfce4-datetime-plugin xfce4-weather-plugin xfce4-xkb-plugin thunar-archive-plugin thunar-media-tags-plugin xfce4-whiskermenu-plugin xfce4-notifyd xfce4-screenshooter xfce4-taskmanager xfce4-power-manager && \

apt install -y ristretto alacritty zip unzip rar unrar gzip firefox-esr okular gedit drawing gnome-clocks file-roller menulibre celluloid font-manager && \

apt remove -y xterm imagemagick imagemagick-6-common imagemagick-6.q16 && \

# AppImage Launcher
curl -LO 'https://github.com/TheAssassin/AppImageLauncher/releases/download/v2.2.0/appimagelauncher_2.2.0-travis995.0f91801.bionic_amd64.deb' && \
dpkg -i appimagelauncher_2.2.0-travis995.0f91801.bionic_amd64.deb && \
rm -f appimagelauncher_2.2.0-travis995.0f91801.bionic_amd64.deb && \

# Qalculate
curl -LO 'https://github.com/Qalculate/libqalculate/releases/download/v5.1.1/qalculate-5.1.1-x86_64.tar.xz' && \
tar -xvf qalculate-5.1.1-x86_64.tar.xz && rm qalculate-5.1.1-x86_64.tar.xz && \
mv qalculate-5.1.1 /opt && \
cp utils/qalculate/qalculate.svg /usr/share/icons && \
cp utils/qalculate/qalculate-gtk.desktop /usr/share/applications && \

#LibreOffice:
#curl -LO https://download.documentfoundation.org/libreoffice/stable/24.2.4/deb/x86_64/LibreOffice_24.2.4_Linux_x86-64_deb.tar.gz && \
#tar -xf LibreOffice_24.2.4_Linux_x86-64_deb.tar.gz && \
#dpkg -i LibreOffice_24.2.4.2_Linux_x86-64_deb/DEBS/*.deb && \
#rm -rf LibreOffice_24.2.4_Linux_x86-64_deb.tar.gz LibreOffice_24.2.4.2_Linux_x86-64_deb && \
apt install -y libreoffice && \
curl -LO https://download.documentfoundation.org/libreoffice/stable/24.2.4/deb/x86_64/LibreOffice_24.2.4_Linux_x86-64_deb_langpack_pt-BR.tar.gz && \
tar -xf LibreOffice_24.2.4_Linux_x86-64_deb_langpack_pt-BR.tar.gz && \
dpkg -i LibreOffice_24.2.4.2_Linux_x86-64_deb_langpack_pt-BR/DEBS/*.deb && \
rm -rf LibreOffice_24.2.4_Linux_x86-64_deb_langpack_pt-BR.tar.gz LibreOffice_24.2.4.2_Linux_x86-64_deb_langpack_pt-BR && \

apt install -y ufw && ufw enable && ufw default deny incoming && ufw default allow outgoing && \

apt install -y ttf-mscorefonts-installer timeshift fonts-jetbrains-mono htop neofetch mugshot picom plank rclone && \

# Zellij
curl -LO 'https://github.com/zellij-org/zellij/releases/download/v0.40.1/zellij-x86_64-unknown-linux-musl.tar.gz' && \
tar -xf 'zellij-x86_64-unknown-linux-musl.tar.gz' && \
rm zellij-x86_64-unknown-linux-musl.tar.gz && \
mkdir /opt/zellij && mv zellij /opt/zellij && \
echo '
if [[ ":$PATH:" != *":/opt/zellij"* ]]; then
    export PATH="$PATH:/opt/zellij"
fi
' | tee -a "$HOME/.bashrc" && \

#Rodar manualmente para configurar idioma do Chromium:
#dpkg-reconfigure locales && locale-gen

###### TEMAS
###### MAC OS THEME

git clone https://www.opencode.net/lsteam/xfce-big-sur-setup-file.git && \
unzip xfce-big-sur-setup-file/update-xfce-bigsur.zip && \
cp -R update-xfce-bigsur/fonts/ "/usr/share/" && \
cp -R update-xfce-bigsur/wallpapers/ "/usr/share/backgrounds/" && \

git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git && \
./WhiteSur-gtk-theme/install.sh && \

git clone https://github.com/vinceliuice/WhiteSur-icon-theme.git && \
./WhiteSur-icon-theme/install.sh && \

git clone https://github.com/vinceliuice/WhiteSur-cursors.git && \
cd WhiteSur-cursors && ./install.sh && cd .. && \

echo '
Configurar Aparência:
	-> Style: WhiteSur-Dark
	-> Icons: WhiteSur-dark
	-> Fonts:
		Padrão: San Francisco Display Regular 10 (Alt: San Francisco Text Regular 11)
		Mono: Iosevka Term Regular 10 (Alt: JetBrains Mono Regular 11)
		Habilitar suavização
		Hinting: Completo
		Ordem de subpixel: Nenhum
	-> Configurações:
		Mostrar imagens nos botões
		Mostrar imagens nos menus
' && \
echo '
Window Manager:
	-> Tema: WhiteSur-Dark
	-> Fonte do título: San Francisco Display Medium 9 (Alt: San Francisco Text Medium 10)
	-> Alinhamento do título: Centro
	-> Botões ativos: Título, minimizar, ampliar, fechar
' && \
echo '
Ordem dos itens no painel:
	-> Menu Whisker (start-icon)
	-> Separador
	-> Alternador de espaço de trabalho
	-> Separador (Expandir)
	-> Plug-in da bandeja de status
	-> Separador
	-> Atualização Meteorológica
	-> Separador
	-> Disposição do teclado
	-> Separador
	-> Wavelan
	-> Separador
	-> Plug-in do PulseAudio
	-> Separador
	-> Plug-in Gerenciador de energia
	-> Separador
	-> Plug-in de Notificações
	-> Separador
	-> Relógio (formato: %a, %d/%m/%Y   %H:%M) (font: San Francisco Text Medium 10)
	-> Separador
	-> Mostrar área de trabalho
' && \
echo '
Alterar a aparência do gerenciador de áreas de trabalho
	-> No nome do espaço de trabalho, procurar o círculo da fonte JetBrains Mono no gerenciador de fontes, copiar e colar
	-> Aparência: Botões
' && \

cp -R WhiteSur-gtk-theme/src/other/plank/* /usr/share/plank/themes && \


# Verifica se o arquivo de inicialização automática do Plank já existe globalmente
if [ ! -f /etc/xdg/autostart/plank.desktop ]; then
    # Cria o arquivo de inicialização automática do Plank globalmente
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



echo '
Configurar dock
	-> Copiar o conteúdo da pasta WhiteSur-gtk-theme/src/other/plank/ para ~/.local/share/plank/themes/
	-> plank --preferences
		-> Tema: theme-Dark
		-> Zoom do ícone: 130
		-> Docklets: add lixeira
	-> Add plank na inicialização (o comando pra iniciar é plank)
' && \

# Verifica se o arquivo de inicialização automática do Picom já existe globalmente
if [ ! -f /etc/xdg/autostart/picom.desktop ]; then
    # Cria o arquivo de inicialização automática do Picom globalmente
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
fi && \


echo '
picom (compositor)
	-> copiar o arquivo xfce-big-sur-setup-file/update-xfce-bugsur/picom/picom.conf
	-> colar em ~/.config/picom
	-> comentar as seguintes linhas nesse arquivo:
		inactive-opacity = 0.8
		frame-opacity = 0.7
		popup_menu = { opacity = 0.8; }
		dropdown_menu = { opacity = 0.8; }
	-> Add picom na inicialização (o comando pra iniciar é picom)
' && \

apt install -y lightdm-gtk-greeter-settings && \

echo 'Tela de login
	-> apt install -y lightdm-gtk-greeter-settings
	-> Copiar os wallpapers para a pasta correta
		-> cp -R ~/Imagens/wallpapers /usr/share/backgrounds
	-> cp -r ~/.themes/ /usr/share/themes
	-> cp -r ~/.local/share/fonts/ /usr/share/fonts/
	-> cp -r ~/.local/share/icons/ /usr/share/icons/
	-> cp ~/.face /usr/share/pixmaps/faces/
	-> Editar o arquivo /var/lib/AccountsService/users/$USER
		-> Alterar o BackgroundFile para alguma imagem da pasta /usr/share/backgrounds/wallpapers
		-> Alterar o caminho do Icon para /usr/share/pixmaps/faces/.face
	-> Substituir o arquivo lightd-gtk-greeter.conf no caminho /etc/lightdm/
' && \

#Copiando arquivos da pasta utils
cp -r utils/plank/*.desktop /usr/share/applications && \
cp -f utils/configs/lightdm-gtk-greeter.conf /etc/lightdm && \

sed -i 's/#greeter-hide-users=false/greeter-hide-users=false/' /etc/lightdm/lightdm.conf && \
sed -i 's/#allow-user-switching=true/allow-user-switching=true/' /etc/lightdm/lightdm.conf && \

# Alacritty Catpuccin theme
if [ ! -d "$HOME/.config/alacritty" ]; then
    echo "Criando pasta $HOME/.config/alacritty..."
    mkdir -p "$HOME/.config/alacritty"
fi && \
cp utils/configs/alacritty/alacritty.yml $HOME/.config/alacritty && \

#GRUB Catpuccin theme
if [ ! -d "/usr/share/grub/themes" ]; then
    echo "Criando pasta /usr/share/grub/themes..."
    mkdir -p "/usr/share/grub/themes"
fi && \
git clone https://github.com/catppuccin/grub.git && \
cp -r grub/src/* /usr/share/grub/themes/ && \
echo '
GRUB_THEME="/usr/share/grub/themes/catppuccin-mocha-grub-theme/theme.txt"
' | tee -a '/etc/default/grub' && \
update-grub && \

#Gedit Catpuccin theme
git clone https://github.com/catppuccin/gedit.git && \
cd gedit && \
./install.sh && \
cd .. && \
rm -rf gedit && \

# Define ZSH as default shell
cp "utils/.zshrc" "$HOME/.zshrc" && \
chsh -s /bin/zsh && \
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k && \

echo 'INSTALAÇÃO CONCLUÍDA COM SUCESSO!'












