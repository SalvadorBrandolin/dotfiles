# Path to your oh-my-zsh installation.
export ZSH="$ZDOTDIR/ohmyzsh"

# Theme
ZSH_THEME="clean" # set by `omz`

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd.mm.yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# =============================================================================
# Personal confs
# =============================================================================
# virtualenvwrapper
source $HOME/.local/bin/virtualenvwrapper.sh

# my scripts
for f in $HOME/.local/bin/my_scripts/*.sh; do source $f; done

# Aliases
alias sioyek="~/.local/share/Sioyek/Sioyek-x86_64.AppImage"
alias zotero="~/.local/share/Zotero/zotero"
alias jill="jill.sh"

alias alias_install_dipy="pip install git+ssh://git@github.com/ipqa-research/dipypr.git"

alias alias_clean_fortran_mod="find . -name '*.mod' -type f -delete && find . -name '*.smod' -type f -delete"

alias alias_clone_fortran_vscode="git clone https://github.com/ipqa-research/vscode-fortran .vscode"
alias alias_clone_cpp_vscode="git clone git@github.com:SalvadorBrandolin/cpp_vscode.git .vscode"

alias alias_clone_ugropy="git clone git@github.com:ipqa-research/ugropy.git"
alias alias_clone_yaeos="git clone git@github.com:ipqa-research/yaeos.git"
alias alias_clone_dipypr="git clone git@github.com:ipqa-research/dipypr.git"

alias alias_jackdrenice="sudo renice -n -20 $(pidof jackdbus)"
