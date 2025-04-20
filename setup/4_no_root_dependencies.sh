#!/bin/bash

# oh-my-zsh
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# Install jill.sh (Julia -- TODO: need to change to juliaup?)
cd $HOME/.local/bin && curl -fsSL https://raw.githubusercontent.com/abelsiqueira/jill/main/jill.sh > jill.sh && cd -

# Install kitty
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

# pipx: fortran things mainly
packages=( fortls findent flinter ford fpm fypp )
    
for package in ${packages[@]}; do
    pipx install $package --force
done