#!/bin/bash
cat << EOF
-----------------------------------THEME INSTALLATION---------------------------------
Comands used:
  cd ~/.themes                                             # enter .themes folder
  aria2c https://github...chive/master.zip -o dracula.zip  # download dracula theme
  unzip dracula.zip                                        # unzip downloaded theme
  mv gtk-master dracula                                    # change unziped file name
  rm dracula.zip                                           # delete zip file

EOF

cd ~/.themes

aria2c https://github.com/dracula/gtk/archive/master.zip -o dracula.zip

unzip ~/.themes/dracula.zip

mv ~/.themes/gtk-master ~/.themes/dracula

rm ~/.themes/dracula.zip
