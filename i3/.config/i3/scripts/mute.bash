#!/bin/bash
pactl set-sink-mute @DEFAULT_SINK@ toggle
sound=`amixer -D pulse sget Master | grep 'Left:' | awk -F'[][]' '{ print $4 }'`
if [ $sound = "on" ]
then
  notify-send "Sound turned on" --icon=~/.config/assets/volume-1.svg --expire-time=900
else
  notify-send "Sound turned off" --icon=~/.config/assets/volume-x.svg --expire-time=900
fi
