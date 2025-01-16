# ~/.profile

# =============================================================================
# XDG paths
# =============================================================================
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_HOME_DIR="$HOME"
export XDG_CONFIG_DIR="$HOME/.config"
export XDG_DESKTOP_DIR="$HOME"
export XDG_TRASH_DIR="$HOME/.local/share/Trash"

# =============================================================================
# Default software to use
# =============================================================================
export TERMINAL=kitty
export TERMCMD=kitty
export EDITOR=nvim
export VISUAL=nvim
export BROWSER=firefox
export SUDO=sudo
export SHELL="/usr/bin/zsh"


# =============================================================================
# Variables
# =============================================================================
# Paths
export PATH="$PATH:/usr/local/include:/usr/include:/usr/bin:/usr/local/sbin:/usr/local/bin:$HOME/packages/julias:$HOME/.local/bin/xdg-ninja:$HOME/.local/bin/my_scripts:$HOME/.local/bin:$HOME/.local/kitty.app/bin/"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/lib"

# Nautilus
export dark_nautilus="GTK_THEME=Adwaita-dark nautilus"
export light_nautilus="GTK_THEME=Adwaita nautilus"

# taskwarrior
export TASKRC="$XDG_CONFIG_HOME/task/taskrc"

# nvm
export NVM_DIR="$XDG_DATA_HOME/nvm"

#ghcup
export GHCUP_USE_XDG_DIRS=true

# dotnet
export DOTNET_CLI_HOME="$XDG_DATA_HOME/dotnet"

# Docker
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"

# Wine
export WINEPREFIX="$XDG_DATA_HOME/wineprefixes/default"

# ZSH
export ZDOTDIR="$HOME/.config/shell/zsh"
export ZSH_CUSTOM="$ZDOTDIR/ohmyzsh/custom"

# Ranger
export RANGER_LOAD_DEFAULT_RC=false

# Zotero variables
export REMOTE_PAPERS="mi_unidad:salvador/doctorado/biblioteca/zotero"
export LOCAL_PAPERS="$XDG_HOME_DIR/Documentos/zotero"

# virtualenvwrapper
export WORKON_HOME="$HOME/.virtualenvs"
export PROJECT_HOME="$XDG_HOME_DIR/code"
export VIRTUALENVWRAPPER_PYTHON="/usr/bin/python3"

# Julia
export JULIA_DEPOT_PATH="$XDG_DATA_HOME/julia:$JULIA_DEPOT_PATH"
export JULIA_HISTORY="$XDG_DATA_HOME/julia/logs/repl_history.jl"
export JULIAUP_DEPOT_PATH="$XDG_DATA_HOME/julia"

# Rust
export CARGO_HOME="$XDG_DATA_HOME/cargo"

# rc confs
[ -f ~/.bashrc ] && . ~/.bashrc
