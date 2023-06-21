#!/bin/sh
# Custom system actions
# This menu opens with mod+u
 
# List of custom launchers:
actions="safe_shutdown
shutdown
reboot
suspend
"
 
 
o=$(echo "$actions" | dmenu -i -fn "Liberation Mono Bold")
 
case "$o" in
        "safe_shutdown") $TERMINAL zsh -i -c "safe_shutdown; exec zsh" ;;
	"shutdown") shutdown now ;;
        "reboot") shutdown -r now ;;
        "suspend") systemctl suspend ;;
esac
