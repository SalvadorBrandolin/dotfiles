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

USER="${USER:-$(whoami)}"

# .local
mkdir -p "$HOME/.local/bin"
mkdir -p "$HOME/.local/share"

# .config
mkdir -p "$HOME/.config/i3"
mkdir -p "$HOME/.config/i3blocks"
mkdir -p "$HOME/.config/kitty"
mkdir -p "$HOME/.config/nvim"
mkdir -p "$HOME/.config/ranger"
mkdir -p "$HOME/.config/shell"

stow . --adopt

read -r -p "¿Reboot now? [Y/n] " answer

answer=${answer:-y}

if [[ "$answer" =~ ^[yY]$ ]]; then
    reboot
else
    echo "No reboot."
fi