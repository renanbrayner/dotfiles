#!/bin/bash
cat << EOF
-----------------------------------YAY INSTALLATION-----------------------------------
Comands used:
  sudo pacman -S --needed git base-devel       # git and base-devel if not installed
  cd ~                                         # back to home
  git clone https://aur.archlinux.org/yay.git  # use git to clone yay repo
  cd yay                                       # enter cloned repo
  makepkg -si                                  # install yay

EOF

sudo pacman -S --needed git base-devel
cd ~
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
