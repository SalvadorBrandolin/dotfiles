#!/bin/bash

o=$(echo -e "Zotero" | dmenu -i -fn "Liberation Mono Bold")

case "$o" in
	"Zotero") ~/.local/share/Zotero/zotero ;;
esac
