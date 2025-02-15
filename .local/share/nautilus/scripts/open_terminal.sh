#!/bin/sh

# When a directory is selected, go there. Otherwise go to current
# directory. If more than one directory is selected, show error.

if [ -n "$NAUTILUS_SCRIPT_SELECTED_FILE_PATHS" ]; then
    set $NAUTILUS_SCRIPT_SELECTED_FILE_PATHS
    if [ $# -eq 1 ]; then
        destination="$1"
        # Go to file's directory if it's a file
        if [ ! -d "$destination" ]; then
            destination="`dirname "$destination"`"
        fi
    else
        zenity --error --title="ERROR! Open terminal here" \
            --text="Plz only select one directory."
        exit 1
    fi
else
    destination="`echo "$NAUTILUS_SCRIPT_CURRENT_URI" | sed 's/^file:\/\///'`"
fi

# It's only possible to go to local directories
if [ -n "`echo "$destination" | grep '^[a-zA-Z0-9]\+:'`" ]; then
    zenity --error --title="ERROR! Open terminal here" \
        --text="Sorry, only local directories can be used."
    exit 1
fi

$TERMINAL --working-directory="$destination"