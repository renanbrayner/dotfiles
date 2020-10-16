#!/bin/bash
echo "---- BACKUPING .oh-my-zsh AND .zshrc"
mv ~/.oh-my-zsh ~/.oh-my-zsh.backup
mv ~/.zshrc ~/.zshrc.backup

echo "---- INSTALLING Oh-my-zsh IN ANOTHER TERMINAL EMULATOR"
kitty -e sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

echo "ATENTION: Press return after Oh-my-zsh installation"
read wait

echo "---- INSTALLING POWERLEVEL9k THEME"
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k


echo "---- STOWING .zshrc"
stow zsh

echo "---- ISNTALLLING ASDF"
git clone https://github.com/asdf-vm/asdf.git ~/.asdf
cd ~/.asdf
git checkout "$(git describe --abbrev=0 --tags)"
echo "---- DONE!"
