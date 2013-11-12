# -*- mode: shell-script -*-
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# source global bash config (if exists)
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
if [ -e $HOME/bin/play ] ; then
    PATH=$PATH:$HOME/bin/play
fi
if [ -e $HOME/bin/maven ]; then
    PATH=$PATH:$HOME/bin/maven/bin
fi
if [ -e $HOME/bin/eclipse ]; then
    PATH=$PATH:$HOME/bin/eclipse
fi
if [ -e $HOME/bin/idea ]; then
    PATH=$PATH:$HOME/bin/idea/bin
fi
if [ -e $HOME/bin/pycharm ]; then
    PATH=$PATH:$HOME/bin/pycharm/bin
fi

# add matlab path
if [ -e /usr/local/MATLAB/R2011a/bin ]; then
    PATH=$PATH:/usr/local/MATLAB/R2011a/bin
fi

# add nvidia cuda path
if [ -e /usr/local/cuda/bin ]; then
    PATH=$PATH:/usr/local/cuda/bin
fi
# add nvidia cuda linker path
#if [ -e /usr/local/cuda/lib ]; then
#    LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib:/usr/local/cuda/lib64
#fi

PS1="\[\e[1;32m\]${debian_chroot:+($debian_chroot)}\u\[\e[0m\]@\[\e[1;32m\]\h\[\e[0m\]:\[\e[1;34m\]\w\[\e[0m\] \$ "

export PATH
#export LD_LIBRARY_PATH
export PS1
export GDK_USE_XFT=1
export EDITOR="emacsclient -c"
export JAVA_HOME="/usr/lib/jvm/jdk1.7.0"

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
