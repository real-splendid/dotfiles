if ! shopt -oq posix; then
    [ -f /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion
fi
[ -f ~/.bash_aliases ] && . ~/.bash_aliases
[ -f ~/dotfiles/scripts/git-prompt.sh ] && source ~/dotfiles/scripts/git-prompt.sh

export SHELL=bash
export TERM="xterm-256color"
export EDITOR=nvim
export BROWSER=w3m

export COMPOSER_HOME="${HOME}/.composer"
export PATH="${PATH}:${COMPOSER_HOME}/vendor/bin"

PS1='\n\[\033[01;32m\]\u@container \[\033[01;34m\]\w\[\033[01;31m\]$(__git_ps1)\[\033[00m\]\n> '

