#!/usr/bin/zsh

source ~/.config/shell/zsh/.zshrc

mkvirtualenv utility
workon utility
pip install numpy scipy matplotlib ipython jupyter thermo numba
pip install -e ~/code/dipypr
pip install -e ~/code/ugropy
deactivate