vol () {
  pamixer $1 10

  vol=`amixer -D pulse sget Master | grep -o '[0-9]\+' | sed -n 5p`

  if [[ $vol -gt 66 ]]
  then
    icon='~/.config/assets/volume-2.svg'
  elif [[ $vol -gt 33 ]]
  then
    icon='~/.config/assets/volume-1.svg'
  else
    icon='~/.config/assets/volume.svg'
  fi

  if [ "$1" = "-i" ]
  then
    message="incresed"
  else
    message="decreased"
  fi

  notify-send "Volume $message by 10%" "Current volume: $vol%" --icon=$icon --expire-time=900
  cvlc --play-and-exit /usr/share/sounds/freedesktop/stereo/audio-volume-change.oga
}

#!/bin/bash
while [ ! $# -eq 0 ]
do
  case "$1" in
    --up)
      vol -i
    exit
    ;;
    --down)
      vol -d
    exit
    ;;
  esac
  shift
done
