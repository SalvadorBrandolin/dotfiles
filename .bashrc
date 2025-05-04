# ===== Personal confs =====
# virtualenvwrapper
if [ -f "$HOME/.local/bin/virtualenvwrapper.sh" ]; then
    source "$HOME/.local/bin/virtualenvwrapper.sh"
elif [ -f "/usr/share/virtualenvwrapper/virtualenvwrapper.sh" ]; then
    source "/usr/share/virtualenvwrapper/virtualenvwrapper.sh"
fi

# my scripts
for f in $HOME/.local/bin/my_scripts/*.sh; do source $f; done

# Alias
alias sioyek="~/.local/share/Sioyek/Sioyek-x86_64.AppImage"
