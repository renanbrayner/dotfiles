# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

## MY SECTION

. $HOME/.asdf/asdf.sh
HISTFILE=~/.zshhist
HISTSIZE=2000
SAVEHIST=2000

setopt appendhistory
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS

# PLUGINS
source ~/.config/powerlevel10k/powerlevel10k.zsh-theme
source ~/.config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# EXPORTS
export EDITOR='nvim'
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export ERL_AFLAGS="-kernel shell_history enabled"
export FZF_DEFAULT_COMMAND='rg --files --follow --no-ignore-vcs --hidden -g "!{node_modules/*,.git/*}"'
export FZF_DEFAULT_OPTS='--border'
export ANDROID_HOME="$HOME/Android/Sdk"
export ANDROID_SDK_ROOT="$HOME/Android/Sdk"

# PATH
PATH=/home/renan/.asdf/installs/nodejs/15.0.1/.npm/lib/node_modules:$PATH
PATH=/home/renan/.asdf/bin:$PATH
PATH=/home/renan/.local/bin:$PATH
PATH=/home/renan/.asdf/installs/nodejs/16.3.0/.npm/bin:$PATH
PATH=$PATH:$ANDROID_SDK_ROOT/tools
PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools
PATH=/snap/bin:$PATH

# ALIAS
alias e="exit"
alias ls="exa -la --group-directories-first"
alias sxiv='devour sxiv'
alias mpv='devour mpv'
alias zathura='devour zathura'
alias tree='tree -I node_modules'
alias svim='sudoedit'
alias vim='nvim'
alias learn='cd ~/code/learn/'
alias rm='rm -i'
alias mv='mv -i'
alias ..='cd ..'
alias neofetch='neofetch --off'
alias susp='systemctl suspend'
alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"'
alias airbnb='npm install --save-dev eslint-config-airbnb eslint eslint-plugin-jsx-a11y eslint-plugin-import eslint-plugin-react eslint-plugin-react-hooks'
alias i3lock='i3lock -B 10  -c 282a3688 --insidecolor=00000000 --insidevercolor=00000000 --insidewrongcolor=00000000 --ringvercolor=50fa7b --ringwrongcolor=ff5555 --ringcolor=6272a4 --linecolor=00000000 --keyhlcolor=8be9fd --separatorcolor=00000000 --bshlcolor=ffb86c --verifcolor=50fa7b --wrongcolor=ff5555
'

## END OF MY SECTION

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
