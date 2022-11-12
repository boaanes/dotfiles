# Colors
autoload -U colors && colors
PS1='%B%F{green}%n@%M%F{white}:%F{blue}%~ %F{purple}$ %F{white}%b'

# Config file path
zstyle :compinstall filename '/home/bo/.zshrc'

# Command history
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Automatically cd to directory
setopt autocd

# No beeping
unsetopt beep

# Auto/tab complete
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# exports
export TERMINAL=/usr/bin/alacritty
export VISUAL=nvim
export EDITOR="$VISUAL"
export CC=/usr/bin/clang
export CXX=/usr/bin/clang++
export LIBVA_DRIVER_NAME=nouveau

# Aliases
alias vim="nvim"
alias pacman="sudo pacman"
alias todo="cd ~/projects/todo"
alias dot="cd ~/docs/dotfiles"
alias web="cd ~/projects/echo-web"
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias tlmgr="/usr/share/texmf-dist/scripts/texlive/tlmgr.pl --usermode"
alias x="startx"

alias ls='ls --color=auto'
alias vi='vim'

# Edit command in vim with Ctrl-E
# autoload edit-command-line; zle -N edit-command-line
# bindkey '^e' edit-command-line

bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

# Pywal
(cat ~/.cache/wal/sequences &)

# For custom scripts
export PATH=$PATH:"/home/bo/.local/bin"
export PATH=$PATH:"/home/bo/.node/bin"

# Fuck less history
export LESSHISTFILE=/dev/null

# For antibody plugin manager (zsh)
source ~/.config/zsh/plugins.sh
eval $(thefuck --alias)

# For zsh syntax highlighting
#source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type d'

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
# Add .NET Core SDK tools
export PATH="$PATH:/home/bo/.dotnet/tools"
