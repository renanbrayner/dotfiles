#!/bin/bash
cat << EOF
------------------------------------STOW ALL FILES------------------------------------
Comands used:
  stow alacritty
  stow assets
  stow deadd
  stow kitty
  stow neofetch
  stow nvim
  stow picom
  stow qutebrowser
  stow ranger
  stow rofi
  stow tint2
  stow vscode
  stow xmonad
  stow xresources

EOF

cd ~/.dotfiles

stow alacritty
stow assets
stow deadd
stow kitty
stow neofetch
stow nvim
stow picom
stow qutebrowser
stow ranger
stow rofi
stow tint2
stow vscode
stow xmonad
stow xresources
