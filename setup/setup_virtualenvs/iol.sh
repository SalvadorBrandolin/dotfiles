#!/usr/bin/zsh

source ~/.config/shell/zsh/.zshrc

mkvirtualenv iol
workon iol
pip install -e ~/code/iol
pip install -r ~/code/iol/requirements-dev.txt
deactivate