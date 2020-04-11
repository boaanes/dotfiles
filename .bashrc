#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w \[\033[35m\]\$ \[\033[00m\]'

export TERMINAL=/usr/bin/termite
export VISUAL=vim
export EDITOR="$VISUAL"

alias pacman="sudo pacman"
alias g="cd ~/Documents/skole/inf112/G-Unit"
alias todo="cd ~/projects/todo"
alias dot="cd ~/Documents/dotfiles"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

#export PATH=$PATH':/home/bo/.gem/ruby/2.6.0/bin'
export PATH="${PATH}:${HOME}/.local/bin/"

# pywal
(cat ~/.cache/wal/sequences &)
