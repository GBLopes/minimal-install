#!/usr/bin/env bash

cp "assets/.zshrc" "$HOME/.zshrc" && \
chsh -s /bin/zsh && \
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
