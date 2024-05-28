#!/bin/bash
# Exit immediately if a command exits with a non-zero status.
set -e

# Install stow
apt update
apt install -y stow

# stow config files
cd $HOME/dotfiles
stow . --adopt