#!/bin/bash
cat << EOF
---------------------------------BACKUPING OLD CONFIGS--------------------------------
Comands used:
  mv ~/.config/alacritty   ~/.config/alacritty.backup
  mv ~/.config/assets      ~/.config/assets.backup
  mv ~/.config/calcurse    ~/.config/calcurse.backup
  mv ~/.config/deadd       ~/.config/deadd.backup
  mv ~/.config/kitty       ~/.config/kitty.backup
  mv ~/.config/nvim        ~/.config/nvim.backup
  mv ~/.config/picom.conf  ~/.config/picom.conf.backup
  mv ~/.config/qutebrowser ~/.config/qutebrowser.backup
  mv ~/.config/ranger      ~/.config/ranger.backup
  mv ~/.config/rofi        ~/.config/rofi.backup
  mv ~/.config/sxhkd       ~/.config/sxhkd.backup
  mv ~/.xprofile           ~/.xprofile.backup
  mv ~/.Xresources         ~/.Xresources.backup
  mv ~/.zshrc              ~/.zshrc.backup
  mv ~/.icons              ~/.icons.backup
  mv ~/.themes             ~/.themes.backup

Warning: if you have any file/folder named the same as any backup it will lost.

EOF

mv ~/.config/alacritty   ~/.config/alacritty.backup
mv ~/.config/assets      ~/.config/assets.backup
mv ~/.config/calcurse    ~/.config/calcurse.backup
mv ~/.config/deadd       ~/.config/deadd.backup
mv ~/.config/kitty       ~/.config/kitty.backup
mv ~/.config/nvim        ~/.config/nvim.backup
mv ~/.config/picom.conf  ~/.config/picom.conf.backup
mv ~/.config/qutebrowser ~/.config/qutebrowser.backup
mv ~/.config/ranger      ~/.config/ranger.backup
mv ~/.config/rofi        ~/.config/rofi.backup
mv ~/.config/sxhkd       ~/.config/sxhkd.backup
mv ~/.xprofile           ~/.xprofile.backup
mv ~/.Xresources         ~/.Xresources.backup
mv ~/.zshrc              ~/.zshrc.backup
mv ~/.icons              ~/.icons.backup
mv ~/.themes             ~/.themes.backup

