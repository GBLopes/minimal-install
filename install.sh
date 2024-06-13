#!/usr/bin/env bash

cd "/home/$USER" && \

# Update sources list
sed -i 's/deb-src/#deb-src/g' /etc/apt/sources.list && \
sed -i 's/main/main contrib non-free/g' /etc/apt/sources.list && \

apt update && apt install bash-completion curl && source /etc/bash_completion && \

# Neovim
mkdir /opt && \
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz && \
tar -C /opt -xzf nvim-linux64.tar.gz && \
echo 'export PATH="$PATH:/opt/nvim-linux64/bin"' >> "/home/$USER/.bashrc" && \
echo 'export PATH="$PATH:/opt/nvim-linux64/bin"' >> "/root/.bashrc" && \
source "/home/$USER/.bashrc" && \
source "/root/.bashrc" && \

sed -i 's/#shopt/shopt/g' "/home/$USER/.bashrc" && \
sed -i 's/#[/[/g' "/home/$USER/.bashrc" && \
sed -i 's/#force_color/force_color/g' "/home/$USER/.bashrc" && \
sed -i 's/#alias/alias/g' "/home/$USER/.bashrc" && \
sed -i 's/#export/export/g' "/home/$USER/.bashrc" && \
sed -i 's/# export/export/g' "/root/.bashrc" && \
sed -i 's/# eval/eval/g' "/root/.bashrc" && \
sed -i 's/# alias/alias/g' "/root/.bashrc" && \

echo 'source /etc/bash_completion' >> "/home/$USER/.bashrc" && \
echo 'source /etc/bash_completion' >> "/root/.bashrc" && \
source "/home/$USER/.bashrc" && \
source "/root/.bashrc" && \

apt install xorg && \

apt install xfce4 && \

apt install xfce4-goodies zip unzip rar unrar gzip chromium evince file-roller menulibre celluloid font-manager && \

apt install chromium-l10n && dpkg-reconfigure locales && locale-gen && \

apt remove xterm && \

#LibreOffice:
curl -LO https://download.documentfoundation.org/libreoffice/stable/24.2.4/deb/x86_64/LibreOffice_24.2.4_Linux_x86-64_deb.tar.gz && \
tar -xf LibreOffice_24.2.4_Linux_x86-64_deb.tar.gz && \
dpkg -i LibreOffice_24.2.4_Linux_x86-64_deb/DEBS/*.deb && \
curl -LO https://download.documentfoundation.org/libreoffice/stable/24.2.4/deb/x86_64/LibreOffice_24.2.4_Linux_x86-64_deb_langpack_pt-BR.tar.gz && \
tar -xf LibreOffice_24.2.4_Linux_x86-64_deb_langpack_pt-BR && \
dpkg -i LibreOffice_24.2.4_Linux_x86-64_deb_langpack_pt-BR/DEBS/*.deb && \

apt install ufw && ufw enable && ufw default deny incoming && ufw default allow outgoing && \

apt install ttf-mscorefonts-installer build-essential timeshift fonts-jetbrains-mono git htop neofetch mugshot picom plank


:`

Criar subvolumes para fazer backup em BTRFS:
	Fazer boot no live CD do Linux Mint
	Abrir o gerenciador de discos e montar a partição /
	Para os seguintes arquivos, alterar o @rootfs para @
		-> @rootfs/boot/grub/grub.cfg
		-> @rootfs/etc/fstab
	Desmontar a partição / e montar a partição /boot e substituir o texto no seguinte caminho:
		-> /EFI/debian/grub.cfg
	Desmontar a partição /boot
	Montar novamente a partição / usando o seguinte comando:
		-> mount -o subvolid=0 /dev/sda2 /mnt
	Entrar na pasta que foi montada (/mnt) e renomear a pasta @rootfs para @:
		-> mv @rootfs @

Colocar snapshots na inicialização do grub (grub-btrfs):
	-> apt install inotify-tools
	-> git clone https://github.com/Antynea/grub-btrfs.git
	-> make install
	-> /etc/grub.d/41_snapshots-btrfs
	-> update-grub
	-> systemctl edit --full grub-btrfsd
		-> Alterar a seguinte linha: ExecStart=/usr/bin/grub-btrfsd --syslog --timeshift-auto
	-> systemctl enable grub-btrfsd
	-> systemctl restart grub-btrfsd 
	OBS.: Sempre que precisar restaurar o sistema, não esquecer de restaurar o snapshot no Timeshift assim que logar

***** TEMAS ******
***** MAC OS THEME *******

git clone https://www.opencode.net/lsteam/xfce-big-sur-setup-file.git

trocar o wallpaper
copiar o conteúdo da pasta fonts para a pasta ~/.local/share/fonts

git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git
	-> Entrar dentro da pasta e executar o arquivo install.sh

git clone https://github.com/vinceliuice/WhiteSur-icon-theme.git
	-> Entrar dentro da pasta e executar o arquivo install.sh

git clone https://github.com/vinceliuice/WhiteSur-cursors.git
	-> Entrar dentro da pasta e executar o arquivo install.sh

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

Window Manager:
	-> Tema: WhiteSur-Dark
	-> Fonte do título: San Francisco Display Medium 9 (Alt: San Francisco Text Medium 10)
	-> Alinhamento do título: Centro
	-> Botões ativos: Título, minimizar, ampliar, fechar

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
	

Alterar a aparência do gerenciador de áreas de trabalho
	-> No nome do espaço de trabalho, procurar o círculo da fonte JetBrains Mono no gerenciador de fontes, copiar e colar
	-> Aparência: Botões

Configurar dock
	-> Copiar o conteúdo da pasta WhiteSur-gtk-theme/src/other/plank/ para ~/.local/share/plank/themes/
	-> plank --preferences
		-> Tema: theme-Dark
		-> Zoom do ícone: 130
		-> Docklets: add lixeira
	-> Add plank na inicialização (o comando pra iniciar é plank)

picom (compositor)
	-> copiar o arquivo xfce-big-sur-setup-file/update-xfce-bugsur/picom/picom.conf
	-> colar em ~/.config/picom
	-> comentar as seguintes linhas nesse arquivo:
		inactive-opacity = 0.8
		frame-opacity = 0.7
		popup_menu = { opacity = 0.8; }
		dropdown_menu = { opacity = 0.8; }
	-> Add picom na inicialização (o comando pra iniciar é picom)

Tela de login
	-> apt install lightdm-gtk-greeter-settings
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






