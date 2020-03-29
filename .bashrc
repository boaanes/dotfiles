#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
#PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w \[\033[35m\]\uE0B0 \[\033[00m\]'
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w \[\033[35m\]\$ \[\033[00m\]'


#function _update_ps1() {
#    PS1=$(powerline-shell $?)
#}

#if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
#    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
#fi

export TERMINAL=/usr/bin/termite

alias pacman="sudo pacman"
alias powertop="sudo powertop"
alias g="cd ~/Documents/skole/inf112/G-Unit"
alias todo="cd ~/projects/todo"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export PATH=$PATH':/home/bo/.gem/ruby/2.6.0/bin'
export PATH=$PATH':/home/bo/.local/bin/i3scripts'
export PATH="${PATH}:${HOME}/.local/bin/"
export PATH=$PATH:/home/bo/.vim/plugged/vim-live-latex-preview/bin/

# pywal
(cat ~/.cache/wal/sequences &)
