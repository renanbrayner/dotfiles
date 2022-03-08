#!/bin/bash
# im a total noob at this, i know that there is a better way to this but i am to lazy to search for it

reset_windowmanager() {
  nitrogen --restore &
  killall picom && picom || picom &
  exec xmonad --restart &
}

connectedCount=$(xrandr --query | grep -c " connected")

one="$HOME/.screenlayout/1.sh"
two="$HOME/.screenlayout/2.sh"
three="$HOME/.screenlayout/3.sh"

if [[ $connectedCount == 1 ]]
then

  # change line bellow to $HOME/.screenlayout/yourlayoutname
  $one && notify-send.py "Display configuration done" "Display count: $connectedCount" \
    --hint string:image-path:video-display boolean:transient:true

  reset_windowmanager

elif [[ $connectedCount == 2 ]]
then

  # change line bellow to $HOME/.screenlayout/yourlayoutname
  $two && notify-send.py "Display configuration done" "Display count: $connectedCount" \
    --hint string:image-path:video-display boolean:transient:true

  reset_windowmanager

elif [[ $connectedCount == 3 ]]
then

  # change line bellow to $HOME/.screenlayout/yourlayoutname
  $three && notify-send.py "Display configuration done" "Display count: $connectedCount" \
    --hint string:image-path:video-display boolean:transient:true

  reset_windowmanager

elif [[ $connectedCount == 4 ]]
then

  # change line bellow to $HOME/.screenlayout/yourlayoutname
  notify-send "Error" "Configuration not found for this number of displays, pelase eddit ~/.config/i3/scripts/monitor.bash" --hint string:image-path:video-display

fi

