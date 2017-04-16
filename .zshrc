# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=10000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/pappix/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

ALIASES_FILE='.aliases'

if [[ -a $ALIASES_FILE ]]; then
	source $ALIASES_FILE
fi

#
# PATH assertions
export GOPATH=$HOME/workspace/go
export PATH=$PATH:$HOME/workspace/go/bin:$HOME/commands/
export EDITOR=vim
export BROWSER=chromium
export BROWSERCLI=w3m
export GNUPGHOME=$HOME/gpg
