#!/bin/sh
# Custom system actions
# This menu opens with mod+u
 
# List of custom launchers:
actions="safe_shutdown
shutdown
reboot
suspend
sync_zotero
myupdate
"
 
 
o=$(echo "$actions" | dmenu -i -fn "Liberation Mono Bold")
 
case "$o" in
        "safe_shutdown") $TERMINAL zsh -i -c "safe_shutdown; exec zsh" ;;
	"shutdown") shutdown now ;;
        "reboot") shutdown -r now ;;
        "suspend") systemctl suspend ;;
        "sync_zotero") $TERMINAL zsh -i -c "sync_zotero; exec zsh" ;;
        "myupdate") $TERMINAL zsh -i -c "sudo myupdate; exec zsh" ;;
esac
