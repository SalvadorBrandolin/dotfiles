#!/bin/sh

myupdate(){
    # apt packages
    apt update && apt upgrade

    # pipx packages
    pipx upgrade-all

    # flatpak packages
    flatpak update

    # self updatable apps
    rclone selfupdate
    omz update

    # neovim
    zsh -c update_nvim

    # git repositories
    cd ~/.local/bin/xdg-ninja && git pull
    cd ~/.config/ranger/plugins/ranger_udisk_menu && git pull
    cd $ZSH_CUSTOM/plugins/zsh-syntax-highlighting && git pull
    cd $ZSH_CUSTOM/plugins/zsh-autosuggestions && git pull
} 
