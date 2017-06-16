# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=10000
PPXDOTS=~/.config
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/pappix/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

autoload -U colors
colors

ALIASES_FILE='.aliases'

if [[ -a $ALIASES_FILE ]]; then
    source $ALIASES_FILE
fi

# vim mode in prompt
# from: Paweł Gościcki http://pawelgoscicki.com/archives/2012/09/vi-mode-indicator-in-zsh-prompt/
vim_ins_mode="%{$fg[yellow]%}INS>%{$reset_color%}"
vim_cmd_mode="%{$fg[green]%}NOR>%{$reset_color%}"
vim_mode=$vim_ins_mode

function zle-keymap-select {
    vim_mode="${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_ins_mode}}"
    zle reset-prompt
}
zle -N zle-keymap-select

function zle-line-finish {
    vim_mode=$vim_ins_mode
}
zle -N zle-line-finish

# Fix a bug when you C-c in CMD mode and you'd be prompted with CMD mode indicator, while in fact you would be in INS mode
# Fixed by catching SIGINT (C-c), set vim_mode to INS and then repropagate the SIGINT, so if anything else depends on it, we will not break it
# Thanks Ron! (see comments)
function TRAPINT() {
    vim_mode=$vim_ins_mode
    return $(( 128 + $1 ))
}

# 10ms for key sequences
#KEYTIMEOUT=3

# Adding missing vim hotkeys
bindkey -a u undo
bindkey -a '^r' redo

bindkey -M viins '^f' history-incremental-search-backward
bindkey -M vicmd '^f' history-incremental-search-backward

bindkey -M viins 'jk' vi-cmd-mode

#
# PATH assertions
export GOPATH=$HOME/workspace/go
export PATH=$PATH:$HOME/workspace/go/bin:$HOME/commands/
export EDITOR=vim
export BROWSER=chromium
export BROWSERCLI=w3m
export GNUPGHOME=$HOME/gpg
export XDG_CONFIG_HOME=$HOME/.config/

source $PPXDOTS/git-prompt.sh

PROMPT='%B%F{cyan}|%1/%#>%b${vim_mode}%f '
# git info on right prompt
setopt prompt_subst
. ~/.config/git-prompt.sh
RPROMPT=$'%B%F{yellow}[$(__git_ps1 "%s")]%f%b'
