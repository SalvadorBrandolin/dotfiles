#!/bin/bash

# Install programs
xargs sudo apt-get install -y < requirements.txt

# GitHub cloning
git clone https://github.com/b3nj5m1n/xdg-ninja.git ~/.local/bin/xdg-ninja
