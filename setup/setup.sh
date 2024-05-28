#!/bin/bash

bash ~/dotfiles/1-stow.sh

# .profile
source ~/.profile

sudo bash ~/dotfiles/2-root_dependencies.sh
bash ~/dotfiles/3-no_root_dependencies.sh
bash ~/4-final_confs.sh