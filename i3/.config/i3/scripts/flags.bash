#!/bin/bash
c_flag='0'
mode=''

print_usage() {
  printf "Usage: screenshot -c -m <mode>"
}

while getopts 'cm:' flag; do
  case "${flag}" in
    c) c_flag=1 ;;
    m) mode="${OPTARG}" ;;
    *) print_usage
       exit 1 ;;
  esac
done

if [ $c_flag -eq 1 ] 
then
  path='png:- | xclip -selection c -t image/png'
  message='Print copied to clipboard'
else
  #TODO: fix this line bellow
  path=~/Pictures/screenshots/`date +"%Y-%m-%d_%H:%M:%S"`".png"
  message='Print saved to ~/Pictures/screenshots'
fi

if [ $mode = "area" ]
then
  selection=""
  title="Printed Selected Area"
elif [ $mode = "window" ]
then
  selection="-window root"
  title="Printed Selected Window"
else
  selection="-window $(xdotool getwindowfocus -f)"
  title="Printed Entire Screen"
fi

import -silent "$selection" "$path"

notify-send "$title" "$message" --icon=~/.config/assets/camera.svg --expire-time=2200

cvlc --play-and-exit /usr/share/sounds/freedesktop/stereo/camera-shutter.oga
