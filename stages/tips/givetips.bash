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
  + ~/.config/i3/config: Change displays, browsers, terminal, keyboard maping, etc.
  + ~/.config/polybar/config: change displays.
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
    and eddit the ~/.config/i3/scripts/monitor.bash (its really bad code im
    a total noob at bash/shell scripting)

-------------------------------------END OF SETUP-------------------------------------
EOF
