Installing
==========
Use `config.sh` script for installing the dotfiles.
Examples:

    ./config.sh vim install
    ./config.sh shell uninstall
    ./config.sh all install

Prerequisites
=============
First, some essential things:

    sudo apt-get install automake autoconf tree cmake checkinstall

Programming languages, compilers and such
=========================================

## c++
Install g++ and valgrind:

    sudo apt-get install g++ valgrind

## haskell-platform
For xmonad and taffybar you're gonna need ghc and cabal. Run

    sudo apt-get install ghc cabal-install happy
    sudo cabal update

Happy is required for ghc-mod support in vim.

## Java from Oracle
Instructions for Ubuntu:
Remove OpenJDK:

    sudo apt-get purge openjdk*

Add repository with Oracle Java installers:

    sudo add-apt-repository ppa:webupd8team/java
    sudo apt-get update

Install Java:

    sudo apt-get install oracle-java8-installer

## LaTeX
Install texlive-full and rubber:

    sudo apt-get install texlive-full rubber

## node.js
Install nodee using the instructions from [here](https://github.com/joyent/node/wiki/Installing-Node.js-via-package-manager)
Then run

    sudo ln -fs `which node` /usr/bin/node

Alternatively, you can install it using apt-get (if version is high enough; on ubuntu 13.10 you can install using the package manager).

    sudo apt-get install nodejs npm
    sudo ln -s /usr/bin/nodejs /usr/bin/node

## python
Python should be installed by default. Install pip and ipython:

    sudo apt-get install python-pip ipython python3-pip

Install virtualenv:

    sudo pip install virtualenv

Various
=======

## ibus
Install ibus-mozc and python-xlib:

    sudo apt-get install ibus-mozc python-xlib

