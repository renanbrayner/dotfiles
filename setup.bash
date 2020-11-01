#!/bin/bash
cat << EOF
------------------------------------START OF SETUP------------------------------------
 ____ _____  _    ____ _____ ___ _   _  ____   ____  _____ _____ _   _ ____  
/ ___|_   _|/ \  |  _ \_   _|_ _| \ | |/ ___| / ___|| ____|_   _| | | |  _ \ 
\___ \ | | / _ \ | |_) || |  | ||  \| | |  _  \___ \|  _|   | | | | | | |_) |
 ___) || |/ ___ \|  _ < | |  | || |\  | |_| |  ___) | |___  | | | |_| |  __/ 
|____/ |_/_/   \_\_| \_\|_| |___|_| \_|\____| |____/|_____| |_|  \___/|_|  

EOF

~/.dotfiles/deletebackups.bash
~/.dotfiles/stages/prep/backup.bash
~/.dotfiles/stages/packages/yayinstall.bash
~/.dotfiles/stages/packages/packagesinstall.bash
~/.dotfiles/stowall.bash
~/.dotfiles/stages/configs/createdirs.bash
~/.dotfiles/stages/theming/icons.bash
~/.dotfiles/stages/theming/theme.bash
~/.dotfiles/stages/tips/givetips.bash
