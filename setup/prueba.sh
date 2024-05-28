#!/bin/bash
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../"
DOTFILES_DIR="$(cd "$DOTFILES_DIR" && pwd)"

echo $DOTFILES_DIR