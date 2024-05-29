#!/bin/bash
# Exit immediately if a command exits with a non-zero status.
set -e

green="\e[32m"
normal="\e[0m"

# Install stow
sudo apt update


echo -e "${green}==============================================================================="
echo -e "${green} Installing stow and stowing"
echo -e "${green}===============================================================================$normal"

sudo apt install -y stow
cd ~/dotfiles
stow . --adopt


echo -e "${green}==============================================================================="
echo -e "${green} Source profile"
echo -e "${green}===============================================================================$normal"

source ~/.profile
cat ~/.profile

# =============================================================================
# Root dependencies
# =============================================================================
sudo bash ~/dotfiles/setup/root_dependencies.sh


echo -e "${green}==============================================================================="
echo -e "${green} No root dependencies"
echo -e "${green}===============================================================================$normal"

# Install oh-my-zsh
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

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


echo -e "${green}==============================================================================="
echo -e "${green} Github cloning"
echo -e "${green}===============================================================================$normal"

# zsh plugins
mkdir "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
mkdir "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions

# xdg ninja
mkdir ~/.local/bin/xdg-ninjas
git clone https://github.com/b3nj5m1n/xdg-ninja.git ~/.local/bin/xdg-ninja

# ranger plugins
mkdir ~/.config/ranger/plugins
git clone https://github.com/SL-RU/ranger_udisk_menu.git ~/.config/ranger/plugins/ranger_udisk_menu

# My code
mkdir ~/code

git clone git@github.com:SalvadorBrandolin/ugropy.git ~/code/ugropy
git clone git@github.com:SalvadorBrandolin/dipypr.git ~/code/dipypr
git clone git@github.com:SalvadorBrandolin/iol.git ~/code/iol


echo -e "${green}==============================================================================="
echo -e "${green} Python setup"
echo -e "${green}===============================================================================$normal"

pip install --user virtualenv virtualenvwrapper

zsh -i -c "./setup_virtualenvs/dipypr.sh"
zsh -i -c "./setup_virtualenvs/ugropy.sh"
zsh -i -c "./setup_virtualenvs/utility.sh"

# set zsh as default shell
chsh -s $(which zsh)