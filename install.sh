#!/usr/bin/env bash

# Desativar beep
echo "blacklist pcspkr" | tee "/etc/modprobe.d/nobeep.conf" > /dev/null

# Update sources list
sed -i 's/deb-src/#deb-src/g' /etc/apt/sources.list && \
sed -i 's/main/main contrib non-free/g' /etc/apt/sources.list && \

apt update && apt install -y bash-completion curl && \

# Neovim
mkdir /opt && \
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz && \
tar -C /opt -xzf nvim-linux64.tar.gz && \
rm nvim-linux64.tar.gz && \
echo '
if [[ ":$PATH:" != *":/opt/nvim-linux64/bin"* ]]; then
    export PATH="$PATH:/opt/nvim-linux64/bin"
fi
' | tee -a "/home/$USER/.bashrc" "/root/.bashrc" && \

echo '
if [[ ":$PATH:" != *":/sbin"* ]]; then
    export PATH="$PATH:/sbin"
fi
' | tee -a "/home/$USER/.bashrc" "/root/.bashrc" && \

echo '
if [[ ":$PATH:" != *":/usr/sbin"* ]]; then
    export PATH="$PATH:/usr/sbin"
fi
' | tee -a "/home/$USER/.bashrc" "/root/.bashrc" && \

sed -i 's/#shopt/shopt/g' "/home/$USER/.bashrc" && \
sed -i 's/#\[/\[/g' "/home/$USER/.bashrc" && \
sed -i 's/#force_color/force_color/g' "/home/$USER/.bashrc" && \
sed -i 's/#alias/alias/g' "/home/$USER/.bashrc" && \
sed -i 's/#export/export/g' "/home/$USER/.bashrc" && \
sed -i 's/# export/export/g' "/root/.bashrc" && \
sed -i 's/# eval/eval/g' "/root/.bashrc" && \
sed -i 's/# alias/alias/g' "/root/.bashrc" && \

echo 'source /etc/bash_completion' >> "/home/$USER/.bashrc" && \
echo 'source /etc/bash_completion' >> "/root/.bashrc" && \

apt install -y xorg && \

apt install -y xfce4 && \

apt install -y xfce4-goodies zip unzip rar unrar gzip chromium evince file-roller menulibre celluloid font-manager && \

apt install -y chromium-l10n && \

apt remove xterm && \

#LibreOffice:
curl -LO https://download.documentfoundation.org/libreoffice/stable/24.2.4/deb/x86_64/LibreOffice_24.2.4_Linux_x86-64_deb.tar.gz && \
tar -xf LibreOffice_24.2.4_Linux_x86-64_deb.tar.gz && \
dpkg -i LibreOffice_24.2.4.2_Linux_x86-64_deb/DEBS/*.deb && \
rm -rf LibreOffice_24.2.4_Linux_x86-64_deb.tar.gz LibreOffice_24.2.4.2_Linux_x86-64_deb && \
curl -LO https://download.documentfoundation.org/libreoffice/stable/24.2.4/deb/x86_64/LibreOffice_24.2.4_Linux_x86-64_deb_langpack_pt-BR.tar.gz && \
tar -xf LibreOffice_24.2.4_Linux_x86-64_deb_langpack_pt-BR.tar.gz && \
dpkg -i LibreOffice_24.2.4.2_Linux_x86-64_deb_langpack_pt-BR/DEBS/*.deb && \
rm -rf LibreOffice_24.2.4_Linux_x86-64_deb_langpack_pt-BR.tar.gz LibreOffice_24.2.4.2_Linux_x86-64_deb_langpack_pt-BR && \

apt install -y ufw && ufw enable && ufw default deny incoming && ufw default allow outgoing && \

apt install -y ttf-mscorefonts-installer build-essential timeshift fonts-jetbrains-mono htop neofetch mugshot picom plank

#Rodar manualmente para configurar idioma do Chromium:
#dpkg-reconfigure locales && locale-gen

***** TEMAS ******
***** MAC OS THEME *******

git clone https://www.opencode.net/lsteam/xfce-big-sur-setup-file.git && \
unzip xfce-big-sur-setup-file/update-xfce-bigsur.zip && \
cp -R update-xfce-bigsur/fonts/ "/home/$USER/.local/share/fonts/" && \
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
    sudo tee /etc/xdg/autostart/plank.desktop > /dev/null <<EOF
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


mkdir /usr/share/picom && \
cp update-xfce-bigsur/picom/picom.conf /usr/share/picom && \

# Arquivo picom.conf
picom_conf="/usr/share/picom/picom.conf" && \

# Comentar linhas específicas
sudo sed -i 's/^inactive-opacity = 0.8/#inactive-opacity = 0.8/' "$picom_conf" && \
sudo sed -i 's/^frame-opacity = 0.7/#frame-opacity = 0.7/' "$picom_conf" && \
sudo sed -i 's/popup_menu = { opacity = 0.8; }/#popup_menu = { opacity = 0.8; }/' "$picom_conf" && \
sudo sed -i 's/dropdown_menu = { opacity = 0.8; }/#dropdown_menu = { opacity = 0.8; }/' "$picom_conf" && \


# Verifica se o arquivo de inicialização automática do Picom já existe globalmente
if [ ! -f /etc/xdg/autostart/picom.desktop ]; then
    # Cria o arquivo de inicialização automática do Picom globalmente
    sudo tee /etc/xdg/autostart/picom.desktop > /dev/null <<EOF
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

mkdir -p /home/$USER/.config/plank/dock1/launchers/ && \

cp -r utils/plank/*.desktop /usr/share/applications && \
cp -r utils/plank/*.dockitem /home/$USER/.config/plank/dock1/launchers && \

cp -f utils/configs/lightdm-gtk-greeter.conf /etc/lightdm && \

cp -r -f utils/configs/xfce4/* /home/$USER/.config/xfce4 && \

echo 'INSTALAÇÃO CONCLUÍDA COM SUCESSO!'












