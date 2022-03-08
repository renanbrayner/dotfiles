#!/bin/bash
cat << EOF
----------------------------------PARU INSTALLATION-----------------------------------
Comands used:
  sudo pacman -S --needed git base-devel
  cd ~
  git clone https://aur.archlinux.org/paru.git
  cd paru
  makepkg -si

EOF

sudo pacman -S --needed git base-devel
cd ~
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
