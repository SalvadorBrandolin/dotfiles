#!/bin/bash
# dmenu custom launchers for apps
# This menu opens with mod+Shift+d

# List of custom launchers:
apps_list="Zotero
Sioyek
Stremio"


o=$(echo -e "$apps_list" | dmenu -i -fn "Liberation Mono Bold")

case "$o" in
	"Zotero") ~/.local/share/Zotero/zotero ;;
	"Sioyek") ~/.local/bin/Sioyek.AppImage ;;
	"Stremio") flatpak run com.stremio.Stremio ;;
esac
