#!/bin/bash
cat << EOF
---------------------------------BACKUPING OLD CONFIGS--------------------------------
Comands used:
  mv ~/.config/alacritty    ~/.config/alacritty.backup 
  mv ~/.config/assets       ~/.config/assets.backup
  mv ~/.config/coc          ~/.config/coc.backup 
  mv ~/.config/deadd        ~/.config/deadd.backup
  mv ~/.config/kitty        ~/.config/kitty.backup 
  mv ~/.config/neofetch     ~/.config/neofetch.backup
  mv ~/.config/nvim         ~/.config/nvim.backup
  mv ~/.config/picom.conf   ~/.config/picom.conf.backup
  mv ~/.config/tint2        ~/.config/tint2.backup
  mv ~/.config/qutebrowser  ~/.config/qutebrowser.backup
  mv ~/.config/ranger       ~/.config/ranger.backup
  mv ~/.config/rofi         ~/.config/rofi.backup 
  mv ~/.config/sxhkd        ~/.config/sxhkd.backup
  mv ~/.icons               ~/.icons.backup
  mv ~/.themes              ~/.themes.backup
  mv ~/.xmonad              ~/.xmonad.backup   

Warning: if you have any file/folder named the same as any backup it will lost.
EOF

mv ~/.config/alacritty    ~/.config/alacritty.backup 
mv ~/.config/assets       ~/.config/assets.backup
mv ~/.config/coc          ~/.config/coc.backup 
mv ~/.config/deadd        ~/.config/deadd.backup
mv ~/.config/kitty        ~/.config/kitty.backup 
mv ~/.config/neofetch     ~/.config/neofetch.backup
mv ~/.config/nvim         ~/.config/nvim.backup
mv ~/.config/picom.conf   ~/.config/picom.conf.backup
mv ~/.config/tint2        ~/.config/tint2.backup
mv ~/.config/qutebrowser  ~/.config/qutebrowser.backup
mv ~/.config/ranger       ~/.config/ranger.backup
mv ~/.config/rofi         ~/.config/rofi.backup 
mv ~/.config/sxhkd        ~/.config/sxhkd.backup
mv ~/.icons               ~/.icons.backup
mv ~/.themes              ~/.themes.backup
mv ~/.xmonad              ~/.xmonad.backup   
