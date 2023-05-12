# .dotfiles
System font:
Liberation Mono

Terminal font
Liberation Mono Bold

install requirements.txt:
xargs sudo apt-get install -y < requirements.txt

To perform a custom xrandr resolution configuration:
Creator a ~/dotfiles/resolution.sh and add the xrand command
It will execute in the i3/config.

# =============================

Set configuration for notebook touchpad (enable touch click):

sudo mkdir -p /etc/X11/xorg.conf.d && sudo tee <<'EOF' /etc/X11/xorg.conf.d/90-touchpad.conf 1> /dev/null
Section "InputClass"
        Identifier "touchpad"
        MatchIsTouchpad "on"
        Driver "libinput"
        Option "Tapping" "on"
EndSection

EOF

# =============================
