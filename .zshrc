bindkey -e
bindkey "^[[3~" delete-char

alias ls='ls --color=auto'
alias ll='ls --color=auto -al'
alias l='ls -CF'
alias head='head -n 15'

local p_mark="%%"
iam=`whoami`
if [ "$iam" = 'root' ]; then
    p_mark="#"
fi
PROMPT="%B%F{green}$USER@%m%f%b:%F{green}%~%f$p_mark "

HISTSIZE=100000
SAVEHIST=100000
setopt append_history
setopt share_history

autoload -U compinit
compinit

export DEB_BUILD_OPTIONS=8
