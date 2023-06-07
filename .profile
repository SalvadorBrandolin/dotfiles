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
export ZDOTDIR="$HOME/.config/shell/zsh"

export PATH="$PATH:$HOME/Documentos/programming/julia/bin:$HOME/.local/bin/xdg-ninja:$HOME/.local/bin/my_scripts:$HOME/.local/bin"

# Zotero variables
export LOCAL_PAPERS="$XDG_HOME_DIR/Documentos/zotero"

# virtualenvwrapper
export WORKON_HOME=$XDG_HOME_DIR/.virtualenvs
export PROJECT_HOME=$HOME/Devel
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3

# Default software to use
export EDITOR=nvim
export BROWSER=firefox
export SUDO=sudo

[ -f ~/.bashrc ] && . ~/.bashrc

