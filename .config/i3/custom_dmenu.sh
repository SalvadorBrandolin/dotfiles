#!/bin/sh
# dmenu custom launchers for apps
# This menu opens with mod+i

# List of custom launchers:
apps_list="Obsidian
Stremio
RetroArch
OpenChrom
Moonlight
"


o=$(echo "$apps_list" | dmenu -i -fn "Liberation Mono Bold")

case "$o" in
	"Obsidian") flatpak run md.obsidian.Obsidian ;;
	"Stremio") flatpak run com.stremio.Stremio ;;
	"RetroArch") flatpak run org.libretro.RetroArch ;;
	"OpenChrom") flatpak run com.lablicate.OpenChrom ;;
	"Moonlight") flatpak run com.moonlight_stream.Moonlight ;;
esac
