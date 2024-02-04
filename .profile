# ~/.profile

# XDG paths
export XDG_CONFIG_HOME="$HOME/.config/"
export XDG_CACHE_HOME="$HOME/.cache/"
export XDG_DATA_HOME="$HOME/.local/share/"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_HOME_DIR="$HOME/"
export XDG_CONFIG_DIR="$HOME/.config/"
export XDG_DESKTOP_DIR="$HOME/"
export XDG_TRASH_DIR="$HOME/.local/share/Trash/"
export WINEPREFIX="$XDG_DATA_HOME"/wineprefixes/default

export ZDOTDIR="$HOME/.config/shell/zsh"
export ZSH_CUSTOM="$ZDOTDIR/ohmyzsh/custom"

export PATH="$PATH:/usr/local/include:/usr/include:/usr/bin:/usr/local/sbin:/usr/local/bin:$HOME/packages/julias:$HOME/.local/bin/xdg-ninja:$HOME/.local/bin/my_scripts:$HOME/.local/bin:$HOME/.local/kitty.app/bin/"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/lib"

# Default software to use
export TERMINAL=kitty
export TERMCMD=kitty
export EDITOR=nvim
export VISUAL=nvim
export BROWSER=firefox
export SUDO=sudo
export SHELL=/usr/bin/zsh

# Ranger
export RANGER_LOAD_DEFAULT_RC=false

# Zotero variables
export REMOTE_PAPERS="mi_unidad:salvador/doctorado/biblioteca/zotero"
export LOCAL_PAPERS="$XDG_HOME_DIR/Documentos/zotero"

# virtualenvwrapper
export WORKON_HOME="$HOME/.virtualenvs"
export PROJECT_HOME="$XDG_HOME_DIR/code"
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3

# Julia
export JULIA_DEPOT_PATH="$XDG_DATA_HOME/julia:$JULIA_DEPOT_PATH"
export JULIA_HISTORY="$XDG_DATA_HOME/julia/logs/repl_history.jl"

[ -f ~/.bashrc ] && . ~/.bashrc