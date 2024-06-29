#!/usr/bin/env bash

# Fazer boot no live CD do Linux Mint
# Abrir o gerenciador de discos e montar a partição /
# Para os seguintes arquivos, alterar o @rootfs para @
# 	-> @rootfs/boot/grub/grub.cfg
# 	-> @rootfs/etc/fstab
# Desmontar a partição / e montar a partição /boot e substituir o texto no seguinte caminho:
# 	-> /EFI/debian/grub.cfg
# Desmontar a partição /boot
# Montar novamente a partição / usando o seguinte comando:
# 	-> mount -o subvolid=0 /dev/sda2 /mnt
# Entrar na pasta que foi montada (/mnt) e renomear a pasta @rootfs para @:
# 	-> mv @rootfs @

# FAZER A CONFIGURAÇÃO INICIAL DO TIMESHIFT ANTES DE RODAR O COMANDO ABAIXO!!!

# Verifica se o usuário atual é root
if [ "$(id -u)" != "0" ]; then
    echo "Este script precisa ser executado como root. Por favor, execute-o com permissões de root."
    exit 1
fi && \

GREEN='\033[0;32m' &&\
NC='\033[0m' && \

# Configurar criação de snapshots automática
echo "${GREEN}Iniciando configuração de snapshots automáticos via grub...${NC}" && \

# inotify-tools
echo "${GREEN}Instalando inotify-tools...${NC}" && \
apt install -y inotify-tools && \

# grub-btrfs
echo "${GREEN}Instalando grub-btrfs...${NC}" && \
git clone https://github.com/Antynea/grub-btrfs.git && \
make install -C grub-btrfs && \
/etc/grub.d/41_snapshots-btrfs && \
rm -rf grub-btrfs && \

# update-grub
echo "${GREEN}update-grub...${NC}" && \
update-grub && \

# config grub-btrfsd.service
echo "${GREEN}Configurando grub-btrfsd.service...${NC}" && \
sed -i 's/\/.snapshots/--timeshift-auto/g' /lib/systemd/system/grub-btrfsd.service && \
systemctl daemon-reload && \
systemctl enable grub-btrfsd && \
systemctl restart grub-btrfsd && \

echo "${GREEN}Configuração de snapshots automáticos FINALIZADA! ${NC}"

#OBS.: Sempre que precisar restaurar o sistema, não esquecer de restaurar o snapshot no Timeshift assim que logar