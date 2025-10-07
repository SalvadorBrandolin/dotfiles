#!/bin/bash

move_if_exists() {
    local src=$1
    local dst=$2
    if [ -e "$src" ]; then
        mkdir -p "$dst"
        mv "$src" "$dst/"
        echo "Moved $src -> $dst"
    fi
}

move_if_exists "$HOME/.cargo" "$CARGO_HOME"
move_if_exists "$HOME/.composer" "$XDG_CONFIG_HOME/composer"
move_if_exists "$HOME/.docker" "$DOCKER_CONFIG"
move_if_exists "$HOME/.dotnet" "$DOTNET_CLI_HOME"
move_if_exists "$HOME/.nvm" "$NVM_DIR"
