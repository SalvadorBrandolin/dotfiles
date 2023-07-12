#!/bin/sh

# List of most used workspaces
# Open with mod+o

workspaces="ReactorD
dotfiles
dipypr"

wp=$(echo "$workspaces" | dmenu -i -fn "Liberation Mono Bold")

case "$wp" in
	"ReactorD") code ~/code/ReactorD ;;
	"dipypr") code ~/code/dipypr ;;
	"dotfiles") code ~/dotfiles ;;
esac
