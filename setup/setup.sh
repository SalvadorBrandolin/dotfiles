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

# usually bad positioned xdg
# .cargo
if [ -e "$HOME/.cargo" ]; then
    if [ ! -d "$CARGO_HOME" ]; then
        mkdir "$CARGO_HOME"
        mv "$HOME/.cargo" "$CARGO_HOME"
    else
        mv "$HOME/.cargo" "$CARGO_HOME"
    fi
fi

# .composer
if [-e "$HOME/.composer"]; then
    if [ ! -d "$XDG_CONFIG_HOME/composer" ]; then
        mkdir "$XDG_CONFIG_HOME/composer"
        mv "$HOME/.composer" "$XDG_CONFIG_HOME/composer"
    else
        mv "$HOME/.composer" "$XDG_CONFIG_HOME/composer"
    fi
fi

# .docker
if [-e "$HOME/.docker"]; then
    if [ ! -d "$DOCKER_CONFIG" ]; then
        mkdir "$DOCKER_CONFIG"
        mv "$HOME/.docker" "$DOCKER_CONFIG"
    else
        mv "$HOME/.docker" "$DOCKER_CONFIG"
    fi
fi

# .dotnet
if [-e "$HOME/.dotnet"]; then
    if [ ! -d "$DOTNET_CLI_HOME" ]; then
        mkdir "$DOTNET_CLI_HOME"
        mv "$HOME/.dotnet" "$DOTNET_CLI_HOME"
    else
        mv "$HOME/.dotnet" "$$DOTNET_CLI_HOME"
    fi
fi

# .nvm
if [-e "$HOME/.nvm"]; then
    if [ ! -d "$NVM_DIR" ]; then
        mkdir "$NVM_DIR"
        mv "$HOME/.nvm" "$NVM_DIR"
    else
        mv "$HOME/.nvm" "$$NVM_DIR"
    fi
fi
