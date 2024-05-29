#!/usr/bin/zsh

source ~/.config/shell/zsh/.zshrc

mkvirtualenv dipypr
workon dipypr
pip install -e ~/code/dipypr
pip install -r ~/code/dipypr/requirements-dev.txt
deactivate