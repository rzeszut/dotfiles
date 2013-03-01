#!/bin/bash

if [ -e /etc/bash.bashrc ]; then
    source /etc/bash.bashrc
fi

## Aliases
alias df='df -h'

alias ls='ls -h --color=auto'
alias l='ls -h --color=auto'
alias lsd='ls -h --color=auto -d */'
alias ll='ls -lhF'
alias la='ls -lahF'
alias emc='emacsclient -c'

## Path section
PATH=$PATH:$HOME/.cabal/bin:$HOME/bin

if [ -e $HOME/bin/scala ]; then
    PATH=$PATH:$HOME/bin/scala/bin
fi
if [ -d $HOME/bin/sbt ]; then
    PATH=$PATH:$HOME/bin/sbt/bin
fi
if [ -e $HOME/bin/maven ]; then
    PATH=$PATH:$HOME/bin/maven/bin
fi
if [ -e $HOME/bin/eclipse ]; then
    PATH=$PATH:$HOME/bin/eclipse
fi

export PATH
export GDK_USE_XFT=1
