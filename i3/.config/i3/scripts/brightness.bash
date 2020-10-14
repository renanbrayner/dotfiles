#!/bin/bash
brightness () {
  brightnessctl --device=intel_backlight s $1
  actual=`cat /sys/class/backlight/intel_backlight/actual_brightness`
  perc=`expr $actual "/" 75`
  if [ $1 = '+10%' ]
  then
    message="increased"
  else
    message="decreased"
  fi
  notify-send "Brightness $message by 10%" "current brightness: $perc%" --icon=~/.config/assets/sun.svg --expire-time=900
}

while [ ! $# -eq 0 ]
do
  case "$1" in
    --up)
      brightness +10%
    exit
    ;;
    --down)
      brightness 10%-
    exit
    ;;
  esac
  shift
done
