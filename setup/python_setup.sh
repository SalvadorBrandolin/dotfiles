#!/bin/bash

# ppa
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update

sudo apt install python3.10 python3.11 python3.12

# Virtualenvs
pip install --user virtualenv virtualenvwrapper

zsh -i -c "~/dotfiles/setup/setup_virtualenvs/ugropy.sh"
zsh -i -c "~/dotfiles/setup/setup_virtualenvs/dipypr.sh"
zsh -i -c "~/dotfiles/setup/setup_virtualenvs/iol.sh"