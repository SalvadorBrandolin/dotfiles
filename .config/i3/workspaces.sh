#!/bin/sh

# List of most used workspaces
# Open with mod+o

workspaces="ReactorD
dipypr
dotfiles
bioactividad2023
"

wp=$(echo "$workspaces" | dmenu -i -fn "Liberation Mono Bold")

case "$wp" in
	"ReactorD") code ~/code/ReactorD ;;
	"dipypr") code ~/code/dipypr ;;
	"dotfiles") code ~/code/dotfiles ;;
	"bioactividad2023") code ~/code/bioactividad_2023 
esac
