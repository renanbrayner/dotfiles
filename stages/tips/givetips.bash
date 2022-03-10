#!/bin/bash
cat << EOF
 ____   ___  _   _ _____ _ 
|  _ \ / _ \| \ | | ____| |
| | | | | | |  \| |  _| | |
| |_| | |_| | |\  | |___|_|
|____/ \___/|_| \_|_____(_)

Next steps:
  Some extra packages that can be usefull:
    vulkan-item
    xf86-video-intel
    xf86-video-vesa

  Notification setup:
    you will need to install notify-send.py to get proper notifications

  Theme setup:
    i recommend installing the dracula gtk theme and the tela icons theme

  You may want to eddit this list of files:
  + ~/.xmonad/xmonad.hs: change window manager configuration
  + ~/.config/sxhkd/sxhkdrc: change keybinds
  + ~/.config/nvim/init.vim: change the custom header and key bindings.
  + ~/.config/zsh/.zshrc: change aliases.

  This script lacks:
  + Display manager: lightdm with https://github.com/NoiSek/Aether recomended.
  + Shell configuration: run setupzsh.bash after starting xsession if you want.
  + Other stuff: i usually change the beep sound for the bell sound etc.

  Changing ugly PC speaker beep sound:
    Add this two lines to the end of /etc/pulse/default.pa:

      load-sample-lazy x11-bell /usr/share/sounds/freedesktop/stereo/bell.oga
      load-module module-x11-bell sample=x11-bell 

    Or change the bell.oga to any sound that fits your taste

  Configure multiple displays:
    to confiure multiple displays run arandr save your layout
    and eddit the ~/.local/bin/monitor.bash (its really bad code im
    a total noob at bash/shell scripting)

  If you want to remove the backups created with the script just run ./deletebackups.bash

-------------------------------------END OF SETUP-------------------------------------
EOF
