#!/usr/bin/env bash

# Configurar backup e snapshots
# Configurar corretamente os subvolumes para usar btrfs no Timeshift
echo '
    -> Fazer boot no live CD do Linux Mint
	-> Abrir o gerenciador de discos e montar a partição /
	-> Para os seguintes arquivos, alterar o @rootfs para @
		-> @rootfs/boot/grub/grub.cfg
		-> @rootfs/etc/fstab
	-> Desmontar a partição / e montar a partição /boot e substituir o texto no seguinte caminho:
		-> /EFI/debian/grub.cfg
	-> Desmontar a partição /boot
	-> Montar novamente a partição / usando o seguinte comando:
		-> mount -o subvolid=0 /dev/sda2 /mnt
	-> Entrar na pasta que foi montada (/mnt) e renomear a pasta @rootfs para @:
		-> mv @rootfs @
'

# FAZER A CONFIGURAÇÃO INICIAL DO TIMESHIFT ANTES DE RODAR O COMANDO ABAIXO!!!

# Configurar criação de snapshots automática
apt install -y inotify-tools && \
git clone https://github.com/Antynea/grub-btrfs.git && \
make install -C grub-btrfs && \
/etc/grub.d/41_snapshots-btrfs && \
rm -rf grub-btrfs && \
update-grub && \
sed -i 's/\/.snapshots/--timeshift-auto/g' /lib/systemd/system/grub-btrfsd.service && \
systemctl daemon-reload && \
systemctl enable grub-btrfsd && \
systemctl restart grub-btrfsd
#OBS.: Sempre que precisar restaurar o sistema, não esquecer de restaurar o snapshot no Timeshift assim que logar