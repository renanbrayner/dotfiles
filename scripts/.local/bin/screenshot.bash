#!/bin/bash
print () {
  import -silent -window root ~/Pictures/screenshots/"`date +"%Y-%m-%d_%H_%M_%S"`".png
  notify-send.sh "Printed Entire Screen" "Print saved to ~/Pictures/screenshots" \
    --hint string:image-path:screenshot \
    --hint int:transient:1 \
    --expire-time=2200

  paplay /usr/share/sounds/freedesktop/stereo/camera-shutter.oga
}

print_window () {
  import -silent -window "$(xdotool getwindowfocus -f)" ~/Pictures/screenshots/"`date +"%Y-%m-%d_%H_%M_%S"`".png
  notify-send.sh "Printed Selected Window" "Print saved to ~/Pictures/screenshots" \
    --hint string:image-path:screenshot \
    --hint int:transient:1 \
    --expire-time=2200

  paplay /usr/share/sounds/freedesktop/stereo/camera-shutter.oga
}

print_area () {
  import -silent ~/Pictures/screenshots/"`date +"%Y-%m-%d_%H_%M_%S"`".png
  notify-send.sh "Printed Selected Area" "Print saved to ~/Pictures/screenshots" \
    --hint string:image-path:screenshot \
    --hint int:transient:1 \
    --expire-time=2200

  paplay /usr/share/sounds/freedesktop/stereo/camera-shutter.oga
}

copy () {
  import -silent -window root png:- | xclip -selection c -t image/png
  notify-send.sh "Printed Entire Screen" "Print copied to clipboard" \
    --hint string:image-path:screenshot \
    --hint int:transient:1 \
    --expire-time=2200

  paplay /usr/share/sounds/freedesktop/stereo/camera-shutter.oga
}

copy_window () {
  import -silent -window "$(xdotool getwindowfocus -f)" png:- | xclip -selection c -t image/png
  notify-send.sh "Printed Selected Window" "Print copied to clipboard" \
    --hint string:image-path:screenshot \
    --hint int:transient:1 \
    --expire-time=2200

  paplay /usr/share/sounds/freedesktop/stereo/camera-shutter.oga
}

copy_area () {
  import -silent png:- | xclip -selection c -t image/png
  notify-send.sh "Printed Selecetd Area" "Print copied to clipboard" \
    --hint string:image-path:screenshot \
    --hint int:transient:1 \
    --expire-time=2200

  paplay /usr/share/sounds/freedesktop/stereo/camera-shutter.oga
}

while [ ! $# -eq 0 ]
do
	case "$1" in
		--print)
        print
			exit
			;;
		--print-window)
        print_window
			exit
			;;
		--print-area)
        print_area
			exit
			;;
		--copy)
        copy
			exit
			;;
		--copy-window)
        copy_window
			exit
			;;
		--copy-area)
      copy_area
			exit
			;;
    -h|--help)
      echo "screenshot [--print, --print-area, --print-window, --copy, --copy-area, --copy-window]"
	esac
	shift
done
