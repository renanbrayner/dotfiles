#!/bin/bash
cat << EOF
------------------------------------STOW ALL FILES------------------------------------
Comands used:
  stow assets
  stow dunst
  stow i3
  stow alacritty
  stow neofetch
  stow nvim
  stow picom
  stow polybar
  stow qutebrowser
  stow ranger
  stow rofi
  stow vscode

EOF

cd ~/.dotfiles
stow assets
stow dunst
stow i3
stow alacritty
stow neofetch
stow nvim
stow picom
stow polybar
stow qutebrowser
stow ranger
stow rofi
stow vscode
