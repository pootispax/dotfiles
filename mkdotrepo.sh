#!/usr/bin/env bash

echo "Removing files ..."
rm -rf user/
rm -rf system/
echo "Files removed successfully"

echo "Copying files ..."
mkdir -p user/.config/
mkdir -p system/X11/xorg.conf.d
mkdir -p system/gdm

# user
cp -r ~/.config/autorandr user/.config/
cp -r ~/.config/bpytop user/.config/
cp -r ~/.config/discord user/.config/
cp -r ~/.config/dunst user/.config/
cp -r ~/.config/flameshot user/.config/
cp -r ~/.config/gtk-2.0 user/.config/
cp -r ~/.config/gtk-3.0 user/.config/
cp -r ~/.config/i3 user/.config/
cp -r ~/.config/polybar user/.config/
cp -r ~/.config/redshift user/.config/
cp -r ~/.config/rofi user/.config/
cp -r ~/.config/sublime-text-3 user/.config/
cp -r ~/.oh-my-zsh user/
cp -r ~/.zsh user/
cp ~/.xbindkeysrc user/
cp ~/.xprofile user/
cp ~/.zshrc user/
echo "User files coppied successfully"

# system
cp -r /etc/X11/xorg.conf.d/* system/X11/xorg.conf.d/
cp -r /etc/gdm/* system/gdm/
echo "System files coppied successfully"

echo "Running git save ..."
git add .

echo "Choose a commit message"
read message
git commit -m $message
git push

echo "Files saved"
