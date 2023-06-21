#!/bin/sh

function syncrc() {
    # Rclone check and sync with pretty output.

    local force=false #don't force bisync by default.

    while getopts ":r:l:fh" opt; do
        case $opt in
            r)
	            local remote="$OPTARG"
		    ;;
            l)
	            local local="$OPTARG"

		    if [ ! -s $local ]; then
			echo "Error: ${local} path doesn't exist"
			return 0
		    fi
		    ;;
            f)
                force=true
            ;;
            h)
                echo "synrc (Sync Rclone) checks remotes and local paths with"
                echo "rclone check and prints the differences with colors."
                echo "If there are diferences between paths the program will"
                echo "ask if the user wants to use rclone bisync with the" 
                echo "paths."
                echo "Flags: "
                echo "  -r string: Specify the remote directory."
                echo "  -l string: Specify the local directory."
                echo "  -f: Force synchronization with bisync --force"
                echo "  -h: Display this help message."
                return 0
            ;;
            \?)
	            echo "Invalid option -$OPTARG" >&2
                return 1
            ;;
        esac
    done

    # Colors
    local default_color="\033[0m"
    local magenta="\033[35m"
    local blue="\033[34m"
    local cian="\033[36m"
    local green="\033[32m"
    local red="\033[31m"

    # Check missings in remote and local and modified files.
    local rmfile="./remotemiss.txt"
    local lmfile="./localmiss.txt"
    local modfile="./modified_files.txt"

    rclone check $remote $local -P \
    --missing-on-src $rmfile \
    --missing-on-dst $lmfile \
	--differ $modfile \
    --quiet && \
    echo "${green}Remote and local are synchronized :)${default_color}" && \
    rm $rmfile $lmfile $modfile && \
    return 0

    # =========================================================================
    # Printings
    # =========================================================================
    # Local missing printing

    echo "----------------------------------------------------"
    
    echo "${magenta}Local missings:"
    
    if [ -s $lmfile ]; then
        cat $lmfile | while IFS= read -r line; do
            echo -e "    ${line}"
        done
    fi

    # Remote missing printing
    echo "${default_color}----------------------------------------------------"

    echo "${blue}Remote missings:"
        
    if [ -s $rmfile ]; then
        cat $rmfile | while IFS= read -r line; do
            echo -e "    ${line}"
        done
    fi

    # Modified files printing
    echo "${default_color}----------------------------------------------------"

    echo "${cian}Modified files:"
        
    if [ -s $modfile ]; then
        cat $modfile | while IFS= read -r line; do
            echo -e "    ${line}"
        done
    fi

    echo "${default_color}----------------------------------------------------"

	echo "${red}Remote and local are not synchronized :(${default_color}"

    printf "Sync remote and local? [Y/n]: "
    read answer
    local answer=${answer:-Y}

    # To sync or not to sync.
    case "$answer" in
    [Yy]*)
        if $force; then
            rclone bisync $remote $local --force -P && \
            rclone check $remote $local --quiet && \
            echo "${green}Successful sync :)${default_color}" && \
            rm $rmfile $lmfile $modfile && \
            return 0
        else
            rclone bisync $remote $local -P && \
            rclone check $remote $local --quiet && \
            echo "${green}Successful sync :)${default_color}" && \
            rm $rmfile $lmfile $modfile && \
            return 0
        fi
        ;;
    [Nn]*)
        echo "${red}Aborting sync!${default_color}"
        return 0
        ;;
    *) 
        echo "${red}Error: Invalid option selected.${default_color}"
        return 1
        ;;
    esac
}
