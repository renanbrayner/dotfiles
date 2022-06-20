# DIFFERENT PROMPT ON TTY
if [[ -n $DISPLAY ]];
then
  eval "$(oh-my-posh init zsh --config ~/.config/poshthemes/kali-mod.omp.json)"
else
  PROMPT="%B%F{magenta}%n%f%b at %F{cyan}%~%f%F{green} > %f"
  RPS1="%B%F{magenta}--INSERT--"
  function zle-line-init zle-keymap-select {
      RPS1="%B%F{magenta}${${KEYMAP/vicmd/--NORMAL--}/(main|viins)/--INSERT--}"
      RPS2=$RPS1
      zle reset-prompt
  }
  zle -N zle-line-init
  zle -N zle-keymap-select
fi

# RICE TTY
if [ "$TERM" = "linux" ]; then
	printf %b '\e[40m' '\e[8]' # set default background to color 0 'dracula-bg'
	printf %b '\e[37m' '\e[8]' # set default foreground to color 7 'dracula-fg'
	printf %b '\e]P0282a36'    # redefine 'black'          as 'dracula-bg'
	printf %b '\e]P86272a4'    # redefine 'bright-black'   as 'dracula-comment'
	printf %b '\e]P1ff5555'    # redefine 'red'            as 'dracula-red'
	printf %b '\e]P9ff7777'    # redefine 'bright-red'     as '#ff7777'
	printf %b '\e]P250fa7b'    # redefine 'green'          as 'dracula-green'
	printf %b '\e]PA70fa9b'    # redefine 'bright-green'   as '#70fa9b'
	printf %b '\e]P3f1fa8c'    # redefine 'brown'          as 'dracula-yellow'
	printf %b '\e]PBffb86c'    # redefine 'bright-brown'   as 'dracula-orange'
	printf %b '\e]P4bd93f9'    # redefine 'blue'           as 'dracula-purple'
	printf %b '\e]PCcfa9ff'    # redefine 'bright-blue'    as '#cfa9ff'
	printf %b '\e]P5ff79c6'    # redefine 'magenta'        as 'dracula-pink'
	printf %b '\e]PDff88e8'    # redefine 'bright-magenta' as '#ff88e8'
	printf %b '\e]P68be9fd'    # redefine 'cyan'           as 'dracula-cyan'
	printf %b '\e]PE97e2ff'    # redefine 'bright-cyan'    as '#97e2ff'
	printf %b '\e]P7f8f8f2'    # redefine 'white'          as 'dracula-fg'
	printf %b '\e]PFffffff'    # redefine 'bright-white'   as '#ffffff'
  echo "foo"
fi

. /opt/asdf-vm/asdf.sh
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

# EXPORTS
export EDITOR='nvim'
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export ERL_AFLAGS="-kernel shell_history enabled"
export FZF_DEFAULT_COMMAND='rg --files --follow --no-ignore-vcs --hidden -g "!{node_modules/*,.git/*}"'
export FZF_DEFAULT_OPTS='--border'
export BAT_THEME='ansi'

# CLEAN-UP
export ANDROID_SDK_HOME="$XDG_CONFIG_HOME/android"
export ANDROID_HOME="$XDG_CONFIG_HOME/Android/Sdk"
export ANDROID_SDK_ROOT="$XDG_CONFIG_HOME/Android/Sdk"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"


# PATH
PATH=/home/renan/.local/bin:$PATH
PATH=$PATH:$ANDROID_SDK_ROOT/tools
PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools
PATH=/snap/bin:$PATH

# ALIAS
## only use icons in exa alias if not on tty
[[ -n $DISPLAY ]] && alias ls="exa -a --group-directories-first --icons" || alias ls="exa -a --group-directories-first"
[[ -n $DISPLAY ]] && alias tree='f(){exa -T -a --group-directories-first --icons "$@"; unset -f f; }; f' || alias tree='f(){exa -T -a --group-directories-first "$@"; unset -f f; }; f'
alias e="exit"
alias sxiv='devour sxiv'
alias mpv='devour mpv'
alias zathura='devour zathura'
alias svim='sudoedit'
alias vim='nvim'
alias learn='cd ~/code/learn/'
alias rm='rm -i'
alias mv='mv -i'
alias ..='cd ..'
alias neofetch='neofetch --source ~/.config/assets/heart.txt'
alias susp='systemctl suspend'
alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"'
alias airbnb='npm install --save-dev eslint-config-airbnb eslint eslint-plugin-jsx-a11y eslint-plugin-import eslint-plugin-react eslint-plugin-react-hooks'
alias i3lock='i3lock -B 10  -c 282a3688 --insidecolor=00000000 --insidevercolor=00000000 --insidewrongcolor=00000000 --ringvercolor=50fa7b --ringwrongcolor=ff5555 --ringcolor=6272a4 --linecolor=00000000 --keyhlcolor=8be9fd --separatorcolor=00000000 --bshlcolor=ffb86c --verifcolor=50fa7b --wrongcolor=ff5555'

# PLUGINS
source ~/.config/zshplugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# source ~/.config/zshplugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh TEMPORARY SOLUTION
[[ -n $DISPLAY ]] && source ~/.config/zshplugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
source ~/.config/zshplugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
