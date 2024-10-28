#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# colors
green="\e[32m"
normal="\e[0m"
red="\e[31m"

echo "========================================================================"
echo "Running Tests"
echo "========================================================================"

# Check if all apt packages are installed
# echo "Checking apt packages..."
# missing_packages=()
# for package in $(cat ~/dotfiles/setup/requirements.txt); do
#     if ! dpkg -l | grep -q $package; then
#         missing_packages+=($package)
#     fi
# done

# if [ ${#missing_packages[@]} -ne 0 ]; then
#     echo -e "${red} Missing apt packages: ${missing_packages[@]} ${normal}"
#     exit 1
# else
#     echo -e "${green} All apt packages are installed. ${normal}"
# fi

# Check if flatpak packages are installed
flatpak_packages=("com.stremio.Stremio" "org.libretro.RetroArch")
missing_flatpak_packages=()
for package in "${flatpak_packages[@]}"; do
    if ! flatpak list | grep -q $package; then
        missing_flatpak_packages+=($package)
    fi
done

if [ ${#missing_flatpak_packages[@]} -ne 0 ]; then
    echo -e "${red} Missing flatpak packages: ${missing_flatpak_packages[@]} ${normal}"
    exit 1
else
    echo -e "${green} All flatpak packages are installed. ${normal}"
fi

# Check oh-my-zsh installation
if [ ! -f "$HOME/.config/shell/zsh/ohmyzsh/oh-my-zsh.sh" ]; then
    echo -e "${red} oh-my-zsh is not installed correctly. ${normal}"
    exit 1
else
    echo -e "${green} oh-my-zsh is installed correctly. ${normal}"
fi

# Check zsh plugins installation
ZSH_CUSTOM="$HOME/.config/shell/zsh/ohmyzsh/custom"
zsh_plugins=("zsh-syntax-highlighting" "zsh-autosuggestions")

for plugin in "${zsh_plugins[@]}"; do
    if [ ! -d "$ZSH_CUSTOM/plugins/$plugin" ]; then
        echo -e "${red} Zsh plugin $plugin is not installed. ${normal}"
        exit 1
    fi
done

echo -e "${green} All zsh plugins are installed. ${normal}"

# Check Python virtual environments
venvs=("ugropy" "dipypr" "iol")

for venv in "${venvs[@]}"; do
    if [ ! -d "$HOME/.virtualenvs/$venv" ]; then
        echo -e "${red} Virtualenv $venv is not created. ${normal}"
        exit 1
    fi
done
echo -e "${green} All virtual environments are created. ${normal}"

# Check git repositories
repos=("dipypr" "iol" "ugropy")

for repo in "${repos[@]}"; do
    if [ ! -d "$HOME/code/$repo" ]; then
        echo -e "${red} Repository $repo is not cloned. ${normal}"
        exit 1
    fi
done
echo -e "${green} All repositories are cloned. ${normal}"

# let's see those xdg
echo "========================================================================"
echo "XDG ninja"
echo "========================================================================"

bash $HOME/.local/bin/xdg-ninja/xdg-ninja.sh --skip-ok --skip-unsupported

echo "========================================================================"
echo "All tests passed successfully!"
echo "========================================================================"
