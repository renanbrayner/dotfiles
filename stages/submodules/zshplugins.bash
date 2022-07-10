#!/bin/bash

cd ~/.dotfiles
git submodule add -f https://github.com/zdharma-continuum/fast-syntax-highlighting zsh/.config/zshplugins/fast-syntax-highlighting
git submodule add -f https://github.com/zsh-users/zsh-autosuggestions zsh/.config/zshplugins/zsh-autosuggestions
git submodule add -f https://github.com/zsh-users/zsh-syntax-highlighting zsh/.config/zshplugins/zsh-syntax-highlighting
git submodule add -f https://github.com/jeffreytse/zsh-vi-mode zsh/.config/zshplugins/zsh-vi-mode
