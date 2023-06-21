#!/bin/sh
# dmenu custom launchers for apps
# This menu opens with mod+Shift+d

# List of custom launchers:
apps_list="Zotero
Sioyek
Stremio
RetroArch"


o=$(echo "$apps_list" | dmenu -i -fn "Liberation Mono Bold")

case "$o" in
	"Zotero") ~/.local/share/Zotero/zotero ;;
	"Sioyek") ~/.local/share/Sioyek/Sioyek-x86_64.AppImage ;;
	"Stremio") flatpak run com.stremio.Stremio ;;
	"RetroArch") flatpak run org.libretro.RetroArch ;;
esac
