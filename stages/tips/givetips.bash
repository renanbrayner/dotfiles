#!/bin/bash
cat << EOF
 ____   ___  _   _ _____ _ 
|  _ \ / _ \| \ | | ____| |
| | | | | | |  \| |  _| | |
| |_| | |_| | |\  | |___|_|
|____/ \___/|_| \_|_____(_)

Next steps:
  Theme activation:
  + run lxappearance and select DarK icon theme and dracula gtk theme.
  + run command feh --bg-fill ~/.config/assets/Dracula.png or Dracula2.png

  You may want to eddit this list of files:
  + .config/i3/config: Change displays, browsers, terminal, keyboard maping, etc.
  + .config/nvim/init.vim: change the custom header and key bindings.
  + .config/zsh/.zshrc: change aliases.

  This script lacks:
  + Display manager: lightdm with https://github.com/NoiSek/Aether recomended.
  + Shell configuration: run setupzsh.bash after starting xsession if you want.
  + Other stuff: i usually change the beep sound for the bell sound etc.

-------------------------------------END OF SETUP-------------------------------------
EOF
