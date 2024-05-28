#!/bin/bash
# Exit immediately if a command exits with a non-zero status.
set -e

# Install stow
sudo apt update
sudo apt install -y stow

# stow config files
cd $HOME/dotfiles
stow . --adopt

# .profile
source ~/.profile

sudo bash ~/dotfiles/setup/2-root_dependencies.sh
bash ~/dotfiles/setup/3-no_root_dependencies.sh
bash ~/setup/4-final_confs.sh