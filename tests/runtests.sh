#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

echo "========================================================================"
echo "Running Tests"
echo "========================================================================"

# Check if all apt packages are installed
echo "Checking apt packages..."
missing_packages=()
for package in $(cat ~/dotfiles/setup/requirements.txt); do
    if ! dpkg -l | grep -q $package; then
        missing_packages+=($package)
    fi
done

if [ ${#missing_packages[@]} -ne 0 ]; then
    echo "Missing packages: ${missing_packages[@]}"
    exit 1
else
    echo "All apt packages are installed."
fi

# Check if flatpak packages are installed
echo "Checking flatpak packages..."
flatpak_packages=("com.stremio.Stremio" "org.libretro.RetroArch")
missing_flatpak_packages=()
for package in "${flatpak_packages[@]}"; do
    if ! flatpak list | grep -q $package; then
        missing_flatpak_packages+=($package)
    fi
done

if [ ${#missing_flatpak_packages[@]} -ne 0 ]; then
    echo "Missing flatpak packages: ${missing_flatpak_packages[@]}"
    exit 1
else
    echo "All flatpak packages are installed."
fi

# Check oh-my-zsh installation
echo "Checking oh-my-zsh installation..."
if [ ! -f "$HOME/.config/shell/zsh/ohmyzsh/oh-my-zsh.sh" ]; then
    echo "oh-my-zsh is not installed correctly."
    exit 1
else
    echo "oh-my-zsh is installed correctly."
fi


# Check zsh plugins installation
echo "Checking zsh plugins installation..."
ZSH_CUSTOM="$HOME/.config/shell/zsh/ohmyzsh/custom"
zsh_plugins=("zsh-syntax-highlighting" "zsh-autosuggestions")
for plugin in "${zsh_plugins[@]}"; do
    if [ ! -d "$ZSH_CUSTOM/plugins/$plugin" ]; then
        echo "Zsh plugin $plugin is not installed."
        exit 1
    fi
done
echo "All zsh plugins are installed."

# Check Python virtual environments
echo "Checking Python virtual environments..."
venvs=("ugropy" "dipypr" "iol")
for venv in "${venvs[@]}"; do
    if [ ! -d "$HOME/.virtualenvs/$venv" ]; then
        echo "Virtualenv $venv is not created."
        exit 1
    fi
done
echo "All virtual environments are created."

# Check git repositories
echo "Checking git repositories..."
repos=("dipypr" "iol" "ugropy")
for repo in "${repos[@]}"; do
    if [ ! -d "$HOME/code/$repo" ]; then
        echo "Repository $repo is not cloned."
        exit 1
    fi
done
echo "All repositories are cloned."

# Check if zsh is the default shell
echo "Checking if zsh is the default shell..."
if [ "$SHELL" != "$(which zsh)" ]; then
    echo "zsh is not the default shell."
    exit 1
else
    echo "zsh is the default shell."
fi

# Check xdg-ninja installation and run it
echo "Checking xdg-ninja installation and running it..."
if [ ! -f "$HOME/.local/bin/xdg-ninja/xdg-ninja.sh" ]; then
    echo "xdg-ninja is not installed correctly."
    exit 1
else
    echo "xdg-ninja is installed correctly. Running xdg-ninja..."
    bash $HOME/.local/bin/xdg-ninja/xdg-ninja.sh --skip-ok --skip-unsupported
fi

echo "========================================================================"
echo "All tests passed successfully!"
echo "========================================================================"
