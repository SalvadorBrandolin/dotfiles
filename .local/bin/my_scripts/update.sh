#!/bin/sh

myupdate(){
    # apt packages
    apt update && apt upgrade

    # flatpak packages
    flatpak update

    # seulf updatable apps
    rclone selfupdate
    omz update

    # git repositories
    cd ~/.local/bin/xdg-ninja && git pull
    cd ~/.config/ranger/plugins/ranger_udisk_menu && git pull
} 
