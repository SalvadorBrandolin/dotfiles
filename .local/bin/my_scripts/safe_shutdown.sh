#!/bin/sh

safe_shutdown() {
    # Check zotero sync
    echo "Zotero pdf's checking"
    echo -----------------------------------------------------
    syncrc -r $REMOTE_PAPERS -l $LOCAL_PAPERS -f

    echo -----------------------------------------------------

    # Check dotfiles
    echo "dotfiles checking"
    echo -----------------------------------------------------
    git -C $HOME/dotfiles status

    echo -----------------------------------------------------

    # Shutdown
    printf "Shutdown computer? [Y/n]: "
    read answer
    local answer=${answer:-Y}

    case "$answer" in
    [Yy]*)
        shutdown now
	;;
    [Nn]*)
        return 0
        ;;
    *)
        echo "${red}Error: Invalid option selected.${default_color}"
	return 1
        ;;
    esac
}
