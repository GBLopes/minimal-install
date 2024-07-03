#!/usr/bin/env bash

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
update-grub