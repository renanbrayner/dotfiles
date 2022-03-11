#!/bin/bash
cat << EOF
------------------------------------START OF SETUP------------------------------------
 ____ _____  _    ____ _____ ___ _   _  ____   ____  _____ _____ _   _ ____
/ ___|_   _|/ \  |  _ \_   _|_ _| \ | |/ ___| / ___|| ____|_   _| | | |  _ \
\___ \ | | / _ \ | |_) || |  | ||  \| | |  _  \___ \|  _|   | | | | | | |_) |
 ___) || |/ ___ \|  _ < | |  | || |\  | |_| |  ___) | |___  | | | |_| |  __/
|____/ |_/_/   \_\_| \_\|_| |___|_| \_|\____| |____/|_____| |_|  \___/|_|


This script will call these files in order:

~/.dotfiles/deletebackups.bash                    # Delete all old backups
~/.dotfiles/stages/prep/backup.bash               # Backup all files modified by the script
~/.dotfiles/stages/packages/paruinstall.bash      # Install paru as AUR helper
~/.dotfiles/stages/packages/packagesinstall.bash  # Install packages with paru
~/.dotfiles/stages/submodules/neovim.bash         # Add my neovim config submodule
~/.dotfiles/stages/submodules/ranger.bash         # Add ranger plugins
~/.dotfiles/stowall.bash                          # Stow files (link to .config)
~/.dotfiles/stages/configs/createdirs.bash        # Create needed directories
~/.dotfiles/stages/tips/givetips.bash             # Give tips on next steps

EOF

# ~/.dotfiles/stages/theming/icons.bash             # Install icon theme
# ~/.dotfiles/stages/theming/theme.bash             # Install theme

read -p "Press enter to continue"

~/.dotfiles/deletebackups.bash
~/.dotfiles/stages/prep/backup.bash
~/.dotfiles/stages/packages/paruinstall.bash
~/.dotfiles/stages/packages/packagesinstall.bash
~/.dotfiles/stages/submodules/neovim.bash
~/.dotfiles/stages/submodules/ranger.bash
~/.dotfiles/stowall.bash
~/.dotfiles/stages/configs/createdirs.bash
# ~/.dotfiles/stages/theming/icons.bash
# ~/.dotfiles/stages/theming/theme.bash
~/.dotfiles/stages/tips/givetips.bash
