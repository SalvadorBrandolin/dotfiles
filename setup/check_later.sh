#!/bin/bash

# usually bad positioned xdg
# .cargo
if [ -e "$HOME/.cargo" ]; then
    if [ ! -d "$CARGO_HOME" ]; then
        mkdir "$CARGO_HOME"
        mv "$HOME/.cargo" "$CARGO_HOME"
    else
        mv "$HOME/.cargo" "$CARGO_HOME"
    fi
fi

# .composer
if [-e "$HOME/.composer"]; then
    if [ ! -d "$XDG_CONFIG_HOME/composer" ]; then
        mkdir "$XDG_CONFIG_HOME/composer"
        mv "$HOME/.composer" "$XDG_CONFIG_HOME/composer"
    else
        mv "$HOME/.composer" "$XDG_CONFIG_HOME/composer"
    fi
fi

# .docker
if [-e "$HOME/.docker"]; then
    if [ ! -d "$DOCKER_CONFIG" ]; then
        mkdir "$DOCKER_CONFIG"
        mv "$HOME/.docker" "$DOCKER_CONFIG"
    else
        mv "$HOME/.docker" "$DOCKER_CONFIG"
    fi
fi

# .dotnet
if [-e "$HOME/.dotnet"]; then
    if [ ! -d "$DOTNET_CLI_HOME" ]; then
        mkdir "$DOTNET_CLI_HOME"
        mv "$HOME/.dotnet" "$DOTNET_CLI_HOME"
    else
        mv "$HOME/.dotnet" "$$DOTNET_CLI_HOME"
    fi
fi

# .nvm
if [-e "$HOME/.nvm"]; then
    if [ ! -d "$NVM_DIR" ]; then
        mkdir "$NVM_DIR"
        mv "$HOME/.nvm" "$NVM_DIR"
    else
        mv "$HOME/.nvm" "$$NVM_DIR"
    fi
fi
