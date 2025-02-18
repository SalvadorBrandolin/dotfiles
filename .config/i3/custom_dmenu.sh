#!/bin/sh
# dmenu custom launchers for apps
# This menu opens with mod+i

# List of custom launchers:
apps_list="Zotero
Obsidian
Sioyek
Stremio
RetroArch
OpenChrom
"


o=$(echo "$apps_list" | dmenu -i -fn "Liberation Mono Bold")

case "$o" in
	"Zotero") ~/.local/share/Zotero/zotero ;;
	"Obsidian") flatpak run md.obsidian.Obsidian ;;
	"Sioyek") ~/.local/share/Sioyek/Sioyek-x86_64.AppImage ;;
	"Stremio") flatpak run com.stremio.Stremio ;;
	"RetroArch") flatpak run org.libretro.RetroArch ;;
	"OpenChrom") flatpak run com.lablicate.OpenChrom ;;
esac
