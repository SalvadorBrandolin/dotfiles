#!/bin/sh

# List of most used workspaces
# Open with mod+o

workspaces="ReactorD
dipypr
ugrupy
dotfiles
bioactividad2023
"

wp=$(echo "$workspaces" | dmenu -i -fn "Liberation Mono Bold")

case "$wp" in
	"ReactorD") code ~/code/ReactorD ;;
	"ugrupy") code ~/code/ugrupy ;;
	"dipypr") code ~/code/dipypr ;;
	"dotfiles") code ~/dotfiles ;;
	"bioactividad2023") code ~/code/bioactividad_2023 ;; 
esac
