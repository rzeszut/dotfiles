alias df='df -h'
alias du='du -h'
alias dua='du -s *'

alias ls='ls -h --color=auto --group-directories-first'
alias l='ls'
alias lsd='ls -d */'
alias ll='ls -lhF'
alias la='ls -lahF'

alias cdtrash='cd ~/.local/share/Trash/files'

if (is_executable thefuck); then
    eval "$(thefuck --alias)"
fi

alias mute="amixer -q sset 'Master' 0%"
alias quiet="amixer -q sset 'Master' 35%"
alias maxvol="amixer -q sset 'Master' 100%"

