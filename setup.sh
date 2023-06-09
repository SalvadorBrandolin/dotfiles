#!/bin/bash

# Install programs
xargs sudo apt-get install -y < requirements.txt

# Install oh-my-zsh
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions


# GitHub cloning
git clone https://github.com/b3nj5m1n/xdg-ninja.git ~/.local/bin/xdg-ninja
