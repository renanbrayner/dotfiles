#!/bin/bash
cat << EOF
------------------------------------START OF SETUP------------------------------------
 ____ _____  _    ____ _____ ___ _   _  ____   ____  _____ _____ _   _ ____  
/ ___|_   _|/ \  |  _ \_   _|_ _| \ | |/ ___| / ___|| ____|_   _| | | |  _ \ 
\___ \ | | / _ \ | |_) || |  | ||  \| | |  _  \___ \|  _|   | | | | | | |_) |
 ___) || |/ ___ \|  _ < | |  | || |\  | |_| |  ___) | |___  | | | |_| |  __/ 
|____/ |_/_/   \_\_| \_\|_| |___|_| \_|\____| |____/|_____| |_|  \___/|_|  

EOF

./stages/packages/yayinstall.bash
./stages/packages/packagesinstall.bash
./stages/configs/stowall.bash
./stages/configs/createdirs.bash
./stages/theming/icons.bash
./stages/theming/theme.bash
./stages/tips/givetips.bash
