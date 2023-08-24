#!/bin/bash

# Install package manager programs
xargs sudo apt-get install -y < requirements.txt

chsh -s $(which zsh)

# Install kitty
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

# Install oh-my-zsh
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions

# Install jill.sh
cd $HOME/.local/bin && curl -fsSL https://raw.githubusercontent.com/abelsiqueira/jill/main/jill.sh > jill.sh && cd -

# flatpak packages
flatpak install avogadro

# GitHub cloning
git clone https://github.com/b3nj5m1n/xdg-ninja.git ~/.local/bin/xdg-ninja
