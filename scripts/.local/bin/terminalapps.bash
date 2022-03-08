terminal=kitty
choice="$(dialog --stdout --radiolist "Press space to select:" 0 0 0 \
  1 "File manager         mod+g " Off \
  2 "System monitor       mod+s " Off \
  3 "Network connection   mod+n " Off \
  4 "Calendar             mod+c " Off \
  5 "Email client         mod+m " Off \
  6 "Telegram             mod+t " Off \
  7 "Text editor          mod+v " On)"

if [ $choice == 1 ]
then
  ranger
elif [ $choice == 2 ]
then
  gotop
elif [ $choice == 3 ]
then
  nmtui
elif [ $choice == 4 ]
then
  calcurse
elif [ $choice == 5 ]
then
  aerc
elif [ $choice == 6 ]
then
  tg
elif [ $choice == 7 ]
then
  exec ~/.local/bin/vim.sh
fi
