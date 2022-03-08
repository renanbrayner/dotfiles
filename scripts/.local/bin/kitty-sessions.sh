#!/bin/sh

terminal=kitty
choice="$(dialog --stdout --radiolist "Press space to select:" 0 0 0 \
  1 "Fraternidade do poker" Off \
  2 "Fixit code" On)"

if [ $choice == 1 ]
then
  kitty --detach --session ~/.config/kitty/sessions/gb-poker
  kill -9 $PPID
elif [ $choice == 2 ]
then
  kitty --detach --session ~/.config/kitty/sessions/fixit
  kill -9 $PPID
# elif [ $choice == 3 ]
# then
#   nmtui
# elif [ $choice == 4 ]
# then
#   calcurse
# elif [ $choice == 5 ]
# then
#   aerc
# elif [ $choice == 6 ]
# then
#   tg
# elif [ $choice == 7 ]
# then
#   nvim
fi

