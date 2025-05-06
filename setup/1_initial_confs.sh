#!/bin/bash

set -e

# colors
green="\e[32m"
normal="\e[0m"

echo -e ${green}
echo -e "====================================================================="
echo -e "Recreating the configuration folders structure and stowing"
echo -e "====================================================================="
echo -e ${normal}

USER="salvador"

mkdir -p /home/$USER/.local/bin
mkdir -p /home/$USER/.local/share

mkdir -p /home/$USER/.config/i3
mkdir -p /home/$USER/.config/i3blocks
mkdir -p /home/$USER/.config/kitty
mkdir -p /home/$USER/.config/nvim
mkdir -p /home/$USER/.config/ranger
mkdir -p /home/$USER/.config/shell

sudo stow . --adopt

read -r -p "¿Reboot now? [Y/n] " answer

answer=${answer:-y}

if [[ "$answer" =~ ^[yY]$ ]]; then
    reboot
else
    echo "No reboot."
fi