#!/bin/bash

DDIR="$HOME/dotfiles"
DIRS_TO_STOW=("$DDIR/.local" "$DDIR/.config")

# Recreate dir structure on HOME config folders
for dir in "${DIRS_TO_STOW[@]}"; do
  find "$dir" -type d | while read -r subdir; do
    target_dir="$HOME/$subdir"
    if [ ! -d "$target_dir" ]; then
      echo "Making dir $target_dir"
      mkdir -p "$target_dir"
    fi
  done
done
