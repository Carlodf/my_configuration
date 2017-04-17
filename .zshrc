# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=10000
PPXDOTS=~/.config
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

source $PPXDOTS/git-prompt.sh

PROMPT='%B%F{cyan}%n@%m%# %b%1/: %f'
# git info on right prompt
setopt prompt_subst
. ~/.config/git-prompt.sh
export RPROMPT=$'%B%F{yellow}[$(__git_ps1 "%s")]%f%b'
