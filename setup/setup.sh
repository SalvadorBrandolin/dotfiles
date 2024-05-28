#!/bin/bash
# Code assumes that git has been already configured (ssh-key)
# =============================================================================
#  1. Starting
# =============================================================================
# Exit immediately if a command exits with a non-zero status.
set -e

# dotfiles directory path
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../"

# Install stow
apt update
apt install -y stow

# stow config files
stow --dir="$DOTFILES_DIR" --target="/home/$SUDO_USER" --adopt

# .profile
source /home/$SUDO_USER/.profile

# Install package manager programs
xargs apt install -y < $DOTFILES_DIR/setup/requirements.txt

# set zsh as default shell
chsh -s $(which zsh)

# Install oh-my-zsh
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions

# =============================================================================
# 2. Not apt packages
# =============================================================================
# Install jill.sh (Julia -- TODO: need to change to juliaup?)
cd $HOME/.local/bin && curl -fsSL https://raw.githubusercontent.com/abelsiqueira/jill/main/jill.sh > jill.sh && cd -

# Install kitty
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

# flatpak packages
flatpak install com.stremio.Stremio
flatpak install org.libretro.RetroArch

# pipx packages
pipx ensurepath

# Install fortran language server, fprettify and flinter
# (block of code stolen from FedeBenelli)
packages=( fortls findent flinter ford fpm fypp )
    
for package in ${packages[@]}; do
    pipx install $package --force
done

# =============================================================================
# 3. GitHub cloning
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
# 4. Python setup
# =============================================================================
pip install --user virtualenv virtualenvwrapper

zsh -i -c "./setup_virtualenvs/dipypr.sh"
zsh -i -c "./setup_virtualenvs/ugropy.sh"
zsh -i -c "./setup_virtualenvs/utility.sh"
