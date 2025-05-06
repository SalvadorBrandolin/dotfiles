#!/bin/bash

set -e

# colors
green="\e[32m"
normal="\e[0m"


echo -e ${green}
echo -e "====================================================================="
echo -e "PPAs"
echo -e "====================================================================="
echo -e ${normal}

# deathsnakes
add-apt-repository -y ppa:deadsnakes/ppa

apt update
apt install -y python3.10 python3.10-venv python3.10-dev
apt install -y python3.11 python3.11-venv python3.11-dev
apt install -y python3.12 python3.12-venv python3.12-dev
apt install -y python3.13 python3.13-venv python3.13-dev


echo -e ${green}
echo -e "====================================================================="
echo -e "Installing apt dependencies"
echo -e "====================================================================="
echo -e ${normal}

# Little update
apt update && apt upgrade

# Install package manager programs
xargs apt install -y < /home/$SUDO_USER/dotfiles/setup/requirements.txt

# Not apt shit
# Zotero
wget -qO- https://raw.githubusercontent.com/retorquere/zotero-deb/master/install.sh | bash
apt update
apt install zotero


echo -e ${green}
echo -e "====================================================================="
echo -e "Installing flatpak dependencies"
echo -e "====================================================================="
echo -e ${normal}

# flatpak packages
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak update
flatpak install -y flathub com.stremio.Stremio
flatpak install -y flathub org.libretro.RetroArch
flatpak install -y flathub md.obsidian.Obsidian


read -r -p "¿Reboot now? [Y/n] " answer

answer=${answer:-y}

if [[ "$answer" =~ ^[yY]$ ]]; then
    reboot
else
    echo "No reboot."
fi
