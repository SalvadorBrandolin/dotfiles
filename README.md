Wallpaper: https://wallpapers.com/wallpapers/metal-gear-rex-metal-gear-solid-8w3bfbgmma8aeg4h.html

## Installing instructions
### Core installation
Username should be `salvador`. Of course, git should be installed and
configured. Also, `stow` must be installed.

```shell
cd
git clone --recurse-submodules git@github.com:SalvadorBrandolin/dotfiles.git
cd dotfiles
./setup/1_initial_confs.sh
```

After rebooting:

```shell
cd ~/dotfiles
sudo ./setup/2_sudo_setup.sh
```

After rebooting:

```shell
cd ~/dotfiles
./setup/3_no_sudo_setup.sh
```

Finally:

```shell
cd ~/dotfiles
git reset --hard
stow . --adopt
./setup/4_git_cloning.sh
sudo chsh -s $(which zsh)
```

### By hand installation
- vscode
- OpenChrom
- Rclone
- Zotero plugins
  - Zotero better bibtex
  - Zotero better notes
  - ZotMoov (https://github.com/wileyyugioh/zotmoov)
- Clone personal repositories

