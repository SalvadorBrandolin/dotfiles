#!/bin/zsh

set -e

echo -e ${green}
echo -e "====================================================================="
echo -e "Installing no root dependencies"
echo -e "====================================================================="
echo -e ${normal}

# Install jill.sh (Julia -- TODO: need to change to juliaup?)
echo -e "${green}Downloading jill.sh...${normal}"

curl -fsSL https://raw.githubusercontent.com/abelsiqueira/jill/main/jill.sh -o "$HOME/.local/bin/jill.sh"
chmod +x "$HOME/.local/bin/jill.sh"

# Install kitty
echo -e "${green}Installing Kitty...${normal}"

curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

# pipx: fortran things mainly
echo -e "${green}Installing pipx packages...${normal}"

packages=( fortls findent flinter ford fypp fpm )
    
for package in ${packages[@]}; do
    pipx install $package --force
done

# oh-my-zsh
# Prevent it from opening a new interactive shell
echo -e "${green}Installing Oh-My-Zsh...${normal}"

export RUNZSH=no
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


# Reboot prompt
read -r -p "¿Reboot now? [Y/n] " answer
answer=${answer:-y}

if [[ "$answer" =~ ^[yY]$ ]]; then
    echo "Rebooting..."
    sudo reboot
else
    echo "No reboot."
fi
