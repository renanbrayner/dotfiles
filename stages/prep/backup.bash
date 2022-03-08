#!/bin/bash
cat << EOF
---------------------------------BACKUPING OLD CONFIGS--------------------------------
Comands used:
  mv ~/.Xresources         ~/.Xresources.backup
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
  mv ~/.local/bin          ~/.local/bin.backup
  mv ~/.xmonad             ~/.xmonad.backup
  mv ~/.xprofile           ~/.xprofile.backup

Warning: if you have any file/folder named the same as any backup it will lost.

You will problably want to move some of your files from ~/.local/bin (now bin.backup)
to the new bin folder

EOF

mv ~/.Xresources         ~/.Xresources.backup
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
mv ~/.local/bin          ~/.local/bin.backup
mv ~/.xmonad             ~/.xmonad.backup
mv ~/.xprofile           ~/.xprofile.backup
