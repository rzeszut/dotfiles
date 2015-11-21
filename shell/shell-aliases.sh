alias df='df -h'
alias du='du -h'

alias ls='ls -h --color=auto'
alias l='ls -h --color=auto'
alias lsd='ls -h --color=auto -d */'
alias ll='ls -lhF'
alias la='ls -lahF'

alias cdtrash='cd ~/.local/share/Trash/files'

if (is_executable thefuck); then
    eval "$(thefuck --alias)"
fi

