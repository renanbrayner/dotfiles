#!/bin/bash
cat << EOF
-----------------------------------YAY INSTALLATION-----------------------------------
Comands used:
  pacman -S --needed git base-devel            # git and base-devel if not installed
  git clone https://aur.archlinux.org/yay.git  # use git to clone yay repo
  cd yay                                       # enter cloned repo
  makepkg -si                                  # install yay

EOF

pacman -S --needed git base-devel
cd ~
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
