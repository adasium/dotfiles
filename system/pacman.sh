#!/usr/bin/env bash

# Editors
sudo pacman -S vim
sudo pacman -S emacs
sudo pacman -S gedit

# emacs
sudo pacman -S hunspell-{pl,en_{us,gb},de}

# python
sudo pacman -S pyvenv

# utils
sudo pacman -S fzf
sudo pacman -S tldr

# fonts
sudo pacman -S ttf-fira-code
yay -S ttf-mononoki

# pipewire over pulseaudio
sudo pacman -Rc pulseaudio  # uninstalls cinnamon
sudo pacman -S pipewire
sudo pacman -S cinnamon

# xbox controller
yay -S xow
