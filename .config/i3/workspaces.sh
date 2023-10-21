#!/bin/sh

# List of most used workspaces
# Open with mod+o

workspaces="ReactorD
dipypr
ugropy
dotfiles
bioactividad2023
articulo_bioactividad
"

wp=$(echo "$workspaces" | dmenu -i -fn "Liberation Mono Bold")

case "$wp" in
	"ReactorD") code ~/code/ReactorD ;;
	"ugropy") code ~/code/ugropy ;;
	"dipypr") code ~/code/dipypr ;;
	"dotfiles") code ~/dotfiles ;;
	"bioactividad2023") code ~/code/bioactividad_2023 ;;
	"articulo_bioactividad") code ~/code/articulo_bioactividad2023 ;;
esac
