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
echo -e ${green}
echo -e "====================================================================="
echo -e "PPAs"
echo -e "====================================================================="
echo -e ${normal}

# Add PPAs
sudo bash ~/dotfiles/setup/1_ppas.sh

# Stow required now
sudo apt install stow

sudo apt update && sudo apt upgrade


echo -e ${green}
echo -e "====================================================================="
echo -e "Recreating the configuration folders structure and stowing"
echo -e "====================================================================="
echo -e ${normal}

sudo bash ~/dotfiles/setup/2_dir_structure.sh
sudo stow . --adopt


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

sudo bash ~/dotfiles/setup/3_root_dependencies.sh


echo -e ${green}
echo -e "====================================================================="
echo -e "Installing no root dependencies"
echo -e "====================================================================="
echo -e ${normal}

sudo bash ~/dotfiles/setup/4_no_root_dependencies.sh


echo -e ${green}
echo -e "====================================================================="
echo -e "Git cloning"
echo -e "====================================================================="
echo -e ${normal}

sudo bash ~/dotfiles/setup/5_git_cloning.sh


echo -e ${green}
echo -e "====================================================================="
echo -e "Python setup"
echo -e "====================================================================="
echo -e ${normal}

sudo bash ~/dotfiles/setup/6_python_setup.sh


echo -e ${green}
echo -e "====================================================================="
echo -e "Final configurations"
echo -e "====================================================================="
echo -e ${normal}

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# zsh plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions

sudo apt update && sudo apt upgrade
