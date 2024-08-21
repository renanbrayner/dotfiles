#!/bin/bash

## Author : Aditya Shakya (adi1090x)
## Mail : adi1090x@gmail.com
## Github : @adi1090x
## Reddit : @adi1090x

# Available Styles
# >> Styles Below Only Works With "rofi-git(AUR)", Current Version: 1.5.4-76-gca067234
# full     full_circle     full_rounded     full_alt
# card     card_circle     column     column_circle
# row     row_alt     row_circle
# single     single_circle     single_full     single_full_circle     single_rounded    single_rounded_dracula     single_text

style="single_rounded"

rofi_command="rofi -monitor primary -theme power/$style.rasi"

uptime=$(uptime -p | sed -e 's/up //g')

# Options
shutdown="󰐥"
reboot="󰜉"
lock="󰌾"
suspend="󰒲"
logout="󰍃"
dir="$HOME/.config/rofi/power"

# Variable passed to rofi
options="$shutdown\n$reboot\n$lock\n$suspend\n$logout"

chosen="$(echo -e "$options" | $rofi_command -p "Uptime: $uptime" -dmenu -selected-row 2)"
case $chosen in
	$shutdown)
		systemctl poweroff
		;;
	$reboot)
		systemctl reboot -i
		;;
	$lock)
		notify-send.sh "Blocking screen..." \
			"This will take a couple seconds."\
			-a "" \
			--hint string:image-path:system-lock-screen\
			--hint int:transient:1
		i3lock-fancy-multimonitor -b=0x8 -n
		;;
	$suspend)
		systemctl suspend
		;;
	$logout)
		killall xmonad-x86_64-linux
		;;
esac
