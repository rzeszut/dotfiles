#!/bin/bash

if [ -e /etc/bash.bashrc ]; then
    source /etc/bash.bashrc
fi

## Aliases
alias df='df -h'

alias ls='ls -h --color=auto'
alias ll='ls -lhF'
alias la='ls -lahF'

## Path section
PATH=$PATH:$HOME/.cabal/bin:$HOME/bin

if [ -e $HOME/bin/sbt ]; then
    PATH=$PATH:$HOME/bin/sbt/bin
fi
if [ -e $HOME/bin/maven/bin ]; then
    PATH=$PATH:$HOME/bin/maven/bin
fi
if [ -e $HOME/bin/eclipse ]; then
    PATH=$PATH:$HOME/bin/eclipse
fi

export PATH
export GDK_USE_XFT=1
