#!/bin/bash
# Exit immediately if a command exits with a non-zero status.
set -e

green="\e[32m"
normal="\e[0m"
echo -e "${green}==============================================================================="
echo -e "${green} Installing apt dependencies"
echo -e "${green}===============================================================================$normal"

# Install package manager programs
xargs apt install -y < /home/$SUDO_USER/dotfiles/setup/requirements.txt

green="\e[32m"
normal="\e[0m"
echo -e "${green}==============================================================================="
echo -e "${green} Installing flatpak dependencies"
echo -e "${green}===============================================================================$normal"

# flatpak packages
flatpak install com.stremio.Stremio
flatpak install org.libretro.RetroArch