#!/bin/bash
# =============================================================================
# The script assumes that git is already configured. Also the dotfiles must
# be stowed and machine rebooted, then run this script.
# =============================================================================
# Exit immediately if a command exits with a non-zero status.
set -e

# =============================================================================
# Variables
# =============================================================================
ZSH_CUSTOM="$HOME/.config/shell/zsh/ohmyzsh/custom"
ZDOTDIR="$HOME/.config/shell/zsh"
ZSH="$ZDOTDIR/ohmyzsh"

green="\e[32m"
normal="\e[0m"
# =============================================================================
# Begin installation
# =============================================================================
sudo apt update

echo -e ${green}
echo -e "====================================================================="
echo -e "Source profile (just in case)"
echo -e "====================================================================="
echo -e ${normal}

source ~/.profile


echo -e ${green}
echo -e "====================================================================="
echo -e "Installing root dependencies"
echo -e "====================================================================="
echo -e ${normal}

sudo bash ~/dotfiles/setup/root_dependencies.sh


echo -e ${green}
echo -e "====================================================================="
echo -e "Installing no root dependencies"
echo -e "====================================================================="
echo -e ${normal}

# oh-my-zsh
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# Install jill.sh (Julia -- TODO: need to change to juliaup?)
cd $HOME/.local/bin && curl -fsSL https://raw.githubusercontent.com/abelsiqueira/jill/main/jill.sh > jill.sh && cd -

# Install kitty
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

# Install fortran language server, fprettify and flinter (FedeBenelli code)
packages=( fortls findent flinter ford fpm fypp )
    
for package in ${packages[@]}; do
    pipx install $package --force
done


echo -e ${green}
echo -e "====================================================================="
echo -e "Git cloning"
echo -e "====================================================================="
echo -e ${normal}

# zsh plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions

# xdg ninja
git clone https://github.com/b3nj5m1n/xdg-ninja.git ~/.local/bin/xdg-ninja

# ranger plugins
git clone https://github.com/SL-RU/ranger_udisk_menu.git ~/.config/ranger/plugins/ranger_udisk_menu

# My code
mkdir ~/code

git clone git@github.com:SalvadorBrandolin/dipypr.git ~/code/dipypr
git clone git@github.com:SalvadorBrandolin/iol.git ~/code/iol
git clone git@github.com:SalvadorBrandolin/ugropy.git ~/code/ugropy


echo -e ${green}
echo -e "====================================================================="
echo -e "Python setup"
echo -e "====================================================================="
echo -e ${normal}

# ppa
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update

sudo apt install python3.10 python3.10-venv
sudo apt install python3.11 python3.11-venv
sudo apt install python3.12 python3.12-venv

# Virtualenvs
pip install --user virtualenv virtualenvwrapper

zsh -i -c "~/dotfiles/setup/setup_virtualenvs/ugropy.sh"
zsh -i -c "~/dotfiles/setup/setup_virtualenvs/dipypr.sh"
zsh -i -c "~/dotfiles/setup/setup_virtualenvs/iol.sh"


echo -e ${green}
echo -e "====================================================================="
echo -e "Final configurations"
echo -e "====================================================================="
echo -e ${normal}

# set zsh as default shell
sudo chsh -s $(which zsh)

sudo apt update && sudo apt upgrade