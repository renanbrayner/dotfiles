#!/bin/bash
# im a total noob at this, i know that there is a better way to this but i am to lazy to search for it

connectedCount=$(xrandr --query | grep -c " connected")

one="$HOME/.screenlayout/1.sh"
two="$HOME/.screenlayout/2_side_vertical.sh"

if [[ $connectedCount == 1 ]]
then

  # change line bellow to $HOME/.screenlayout/yourlayoutname
  $one && notify-send "Display configuration done" "Display count: $connectedCount" --icon $HOME/.config/assets/monitor.svg

elif [[ $connectedCount == 2 ]]
then

  # change line bellow to $HOME/.screenlayout/yourlayoutname
  $two && notify-send "Display configuration done" "Display count: $connectedCount" --icon $HOME/.config/assets/monitor.svg

elif [[ $connectedCount == 3 ]]
then

  # change line bellow to $HOME/.screenlayout/yourlayoutname
  notify-send "Error" "Configuration not found for this number of displays, pelase eddit ~/.config/i3/scripts/monitor.bash" --icon $HOME/.config/assets/monitor.svg

elif [[ $connectedCount == 4 ]]
then

  # change line bellow to $HOME/.screenlayout/yourlayoutname
  notify-send "Error" "Configuration not found for this number of displays, pelase eddit ~/.config/i3/scripts/monitor.bash" --icon $HOME/.config/assets/monitor.svg

fi && ~/.fehbg
