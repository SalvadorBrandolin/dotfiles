#!/bin/zsh

set -e

# ohmyzsh plugins
mkdir -p $ZSH_CUSTOM/plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting || echo "Already cloned"
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions || echo "Already cloned"

# xdg ninja
git clone https://github.com/b3nj5m1n/xdg-ninja.git ~/.local/bin/xdg-ninja

# My code (clone manually the thing you want)
mkdir -p ~/code

git clone git@github.com:ipqa-research/ugropy.git ~/code/ugropy
git clone https://github.com/ipqa-research/yaeos ~/code/yaeos
