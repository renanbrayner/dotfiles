#!/bin/bash
cat << EOF
------------------------------------ICON INSTALLATION---------------------------------
Comands used:
  cd ~/.icons                                                   # enter .icons folder
  aria2c https://gitlab.co ... ns-master.tar -o dark-icons.tar  # download icon theme
  tar -xvf dark-icons.tar                                       # decompress download
  chmod +x ~/.icons/DarK-icons-master/build_svg.sh              # give permission
  ~/.icons/DarK-icons-master/build_svg.sh                       # run icon script
  mv ~/.icons/DarK-icons-master/DarK-svg ~/.icons/DarK-svg      # move icon to .icon
  rm -rf ~/.icons/DarK-icons-master dark-icons.tar              # remove compressed file

EOF

cd ~/.icons

aria2c https://gitlab.com/sixsixfive/DarK-icons/-/archive/master/DarK-icons-master.tar -o dark-icons.tar

tar -xvf dark-icons.tar

chmod +x ~/.icons/DarK-icons-master/build_svg.sh

~/.icons/DarK-icons-master/build_svg.sh

mv ~/.icons/DarK-icons-master/DarK-svg ~/.icons/DarK-svg

rm -rf ~/.icons/DarK-icons-master dark-icons.tar
