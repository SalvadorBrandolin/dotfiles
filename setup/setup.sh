#!/bin/bash
# Exit immediately if a command exits with a non-zero status.
set -e

bash ~/dotfiles/setup/1-stow.sh

# .profile
source ~/.profile

sudo bash ~/dotfiles/setup/2-root_dependencies.sh
bash ~/dotfiles/setup/3-no_root_dependencies.sh
bash ~/setup/4-final_confs.sh