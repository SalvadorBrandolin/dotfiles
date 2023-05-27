#!/bin/bash

# List of most used workspaces
# Open with mod+Shift+w

workspaces="ReactorD"

wp=$(echo -e "$workspaces" | dmenu -i -fn "Liberation Mono Bold")

case "$wp" in
	"ReactorD") code ~/code/ReactorD ;;
esac
