#!/bin/bash
cat << EOF
------------------------------------STOW ALL FILES------------------------------------
Comands used:
  cd ~/.dotfiles

  stow alacritty
  stow assets
  stow calcurse
  stow deadd
  stow kitty
  stow nvim
  stow picom
  stow qutebrowser
  stow ranger
  stow rofi
  stow scripts
  stow sxhkd
  stow xmobar
  stow xmonad
  stow xprofile
  stow xresources
  stow zsh

EOF

cd ~/.dotfiles

stow alacritty
stow mpv
stow notes
stow assets
stow calcurse
stow kitty
stow nvim
stow picom
stow qutebrowser
stow ranger
stow rofi
stow scripts
stow sxhkd
stow xmobar
stow xmonad
stow xprofile
stow xresources
stow zsh
