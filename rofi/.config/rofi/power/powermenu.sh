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

rofi_command="rofi -monitor eDP1 -theme power/$style.rasi"

uptime=$(uptime -p | sed -e 's/up //g')

# Options
shutdown=""
reboot="ﰇ"
lock=""
suspend="鈴"
logout=""
dir="$HOME/.config/rofi/power"

# Variable passed to rofi
options="$shutdown\n$reboot\n$lock\n$suspend\n$logout"

chosen="$(echo -e "$options" | $rofi_command -p "Uptime: $uptime" -dmenu -selected-row 2)"
case $chosen in
    $shutdown)
      systemctl poweroff
      ;;
    $reboot)
      systemctl reboot
      ;;
    $lock)
      i3lock -B 10  -c 282a3688 --insidecolor=00000000 --insidevercolor=00000000 --insidewrongcolor=00000000 --ringvercolor=50fa7b --ringwrongcolor=ff5555 --ringcolor=6272a4 --linecolor=00000000 --keyhlcolor=8be9fd --separatorcolor=00000000 --bshlcolor=ffb86c --verifcolor=50fa7b --wrongcolor=ff5555
      ;;
    $suspend)
      mpc -q pause
      amixer set Master mute
      systemctl suspend
      ;;
    $logout)
      i3-msg exit || killall xmonad-x86_64-l
      ;;
esac
