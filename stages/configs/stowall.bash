#!/bin/bash
cat << EOF
------------------------------------STOW ALL FILES------------------------------------
Comands used:
  stow ~/.dotfiles/<all folders name> # for each folder except zsh

EOF

stow ~/.dotfiles/assets
stow ~/.dotfiles/dunst
stow ~/.dotfiles/i3
stow ~/.dotfiles/kitty
stow ~/.dotfiles/neofetch
stow ~/.dotfiles/nvim
stow ~/.dotfiles/picom
stow ~/.dotfiles/polybar
stow ~/.dotfiles/qutebrowser
stow ~/.dotfiles/ranger
stow ~/.dotfiles/rofi
stow ~/.dotfiles/vscode
