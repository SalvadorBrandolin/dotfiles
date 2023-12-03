#!/usr/bin/zsh

source ~/.config/shell/zsh/.zshrc

mkvirtualenv ugropy
workon ugropy
pip install -e ~/code/ugropy
pip install -r ~/code/ugropy/requirements-dev.txt
deactivate