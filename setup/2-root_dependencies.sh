#!/bin/bash
# Exit immediately if a command exits with a non-zero status.
set -e

# Install package manager programs
xargs apt install -y < $DOTFILES_DIR/setup/requirements.txt

# flatpak packages
flatpak install com.stremio.Stremio
flatpak install org.libretro.RetroArch