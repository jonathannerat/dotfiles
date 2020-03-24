alias v='vim'
alias V='SUDO_EDITOR="vim" sudo -e'
alias edit='vim'

alias c='xclip' # primary (^Insert)
alias xc='xclip -selection c' # clipboard (^C)

alias ls='ls --color=auto'
alias ll='ls -la'
alias l.='ls -d .*'

alias cd..='cd ..'
alias ..='cd ..'
alias mkdir='mkdir -p'
alias dot="cd $DOTFILES"

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias info='info --vi-keys'

if [ -f "$HOME/.cfg_aliases" ]; then
    while read -r cfg file; do
        alias cfg$cfg="vim $HOME/$file"
    done < <(trimconf "$HOME/.cfg_aliases")
fi
