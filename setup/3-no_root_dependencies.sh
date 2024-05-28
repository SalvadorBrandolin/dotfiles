#!/bin/bash
# Install oh-my-zsh
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions

# Install jill.sh (Julia -- TODO: need to change to juliaup?)
cd $HOME/.local/bin && curl -fsSL https://raw.githubusercontent.com/abelsiqueira/jill/main/jill.sh > jill.sh && cd -

# Install kitty
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

# Install fortran language server, fprettify and flinter
# (block of code stolen from FedeBenelli)
packages=( fortls findent flinter ford fpm fypp )
    
for package in ${packages[@]}; do
    pipx install $package --force
done

# =============================================================================
# GitHub cloning
# =============================================================================
# xdg ninja
git clone https://github.com/b3nj5m1n/xdg-ninja.git ~/.local/bin/xdg-ninja

# ranger plugins
mkdir ~/.config/ranger/plugins
git clone https://github.com/SL-RU/ranger_udisk_menu.git ~/.config/ranger/plugins/ranger_udisk_menu

# My code
mkdir ~/code

git clone git@github.com:SalvadorBrandolin/ugropy.git ~/code/ugropy
git clone git@github.com:SalvadorBrandolin/dipypr.git ~/code/dipypr
git clone git@github.com:SalvadorBrandolin/iol.git ~/code/iol

# =============================================================================
# Python setup
# =============================================================================
pip install --user virtualenv virtualenvwrapper

zsh -i -c "./setup_virtualenvs/dipypr.sh"
zsh -i -c "./setup_virtualenvs/ugropy.sh"
zsh -i -c "./setup_virtualenvs/utility.sh"
