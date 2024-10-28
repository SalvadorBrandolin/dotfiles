#!/bin/bash

# =============================================================================
# The script assumes that git is already configured. Also stow must be 
# installed, then run this script.
#
# With:
# >>> pwd
# >>> ~/dotfiles
#
# To install do:
# >>> sudo bash setup/setup.sh
# =============================================================================
# Exit immediately if a command exits with a non-zero status.
set -e

# colors
green="\e[32m"
normal="\e[0m"

# =============================================================================
# Begin setup
# =============================================================================
sudo apt update && sudo apt upgrade

echo -e ${green}
echo -e "====================================================================="
echo -e "Recreating the configuration folders structure and stowing"
echo -e "====================================================================="
echo -e ${normal}

sudo bash ~/dotfiles/setup/dir_structure.sh
stow . --adopt


echo -e ${green}
echo -e "====================================================================="
echo -e "Source profile"
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

sudo bash ~/dotfiles/setup/no_root_dependencies.sh


echo -e ${green}
echo -e "====================================================================="
echo -e "Git cloning"
echo -e "====================================================================="
echo -e ${normal}

sudo bash ~/dotfiles/setup/git_cloning.sh


echo -e ${green}
echo -e "====================================================================="
echo -e "Python setup"
echo -e "====================================================================="
echo -e ${normal}

sudo bash ~/dotfiles/setup/python_setup.sh


echo -e ${green}
echo -e "====================================================================="
echo -e "Final configurations"
echo -e "====================================================================="
echo -e ${normal}

# set zsh as default shell
sudo chsh -s $(which zsh)

sudo apt update && sudo apt upgrade
