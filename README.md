Installing
==========
For installing all the dotfiles just type

    make

For installing one specific configuration, e.g.

    make -B vim

To uninstall the config

    make -B uninstall


Prerequisites
=============
First, some essential things:

    sudo apt-get install automake autoconf tree cmake checkinstall


Programming languages, compilers and such
-----------------------------------------

### c++
Install g++ and valgrind:

    sudo apt-get install g++ valgrind

### clojure
Install clojure and leiningen 2:

    sudo apt-get install clojure leiningen

If lein2 is not available, use the download script from [here](http://leiningen.org/).
Note: when using emacs with clojure, start it from terminal by hand (no dmenu!). Otherwise, it can't see leiningen executable and nrepl fails.

### haskell-platform
For xmonad and taffybar you're gonna need ghc and cabal. Run

    sudo apt-get install ghc cabal-install
    sudo cabal update

### Java from Oracle
Instructions for Ubuntu:
Remove OpenJDK:

    sudo apt-get purge openjdk*

Add repository with Oracle Java installers:

    sudo add-apt-repository ppa:webupd8team/java
    sudo apt-get update

Install Java:

    sudo apt-get install oracle-java7-installer

### LaTeX
Install texlive-full and rubber:

    sudo apt-get install texlive-full rubber

### node.js
Install nodee using the instructions from [here](https://github.com/joyent/node/wiki/Installing-Node.js-via-package-manager)
Then run

    sudo ln -fs `which node` /usr/bin/node

Alternatively, you can install it using apt-get (if version is high enough; on ubuntu 13.10 you can install using the package manager).

    sudo apt-get install nodejs npm
    sudo ln -s /usr/bin/nodejs /usr/bin/node

### octave
Just install octave:

    sudo apt-get install octave

### python
Python should be installed by default. Install pip and ipython:

    sudo apt-get install python-pip ipython

Install virtualenv:

    sudo pip install virtualenv

### Ruby and Rails
First have node.js (or any other JS runtime) installed.
Install ruby, and gem:

    sudo apt-get install ruby ruby-dev build-essential rubygems libsqlite3-dev

Install rails:

    sudo gem install rails

### scala and sbt
Download the latest version of scala from [here](http://www.scala-lang.org/downloads)
and extract it into ~/bin.
Run:

    cd ~/bin
    rm scala-*.tgz
    ln -fs scala-* scala

Then download the latest version of sbt-launch from [here](http://www.scala-sbt.org/release/docs/Getting-Started/Setup.html) and extract it into ~/bin.
Run:

    chmod +x ~/bin/sbt/bin/sbt

### sqlite
Install sqlite3:

    sudo apt-get install sqlite3


Zsh
---
Install zsh

    sudo apt-get install zsh zsh-doc


Emacs
-----
Install emacs 24 using instructions from [emacs-wiki](http://wikemacs.org/wiki/Installing_Emacs_on_GNU/Linux).

For syntax highlighting in orgmode LaTeX export:

    sudo pip install Pygments
    sudo apt-get install epstool

For ditaa support download ditaa from [here](http://ditaa.sourceforge.net/) and put the jar into ~/bin.

Install jedi and epc (needed for emacs auto-completion):

    sudo pip install jedi epc


Vim
---
Requires git.
Install vim (preferably gvim)

    sudo apt-get install vim-gtk exuberant-ctags

Install libraries required for YouCompleteMe (full instruction [here](https://github.com/Valloric/YouCompleteMe)):

    sudo apt-get install build-essential cmake python-dev

YouCompleteMe requires compiling vim by hand (in most cases), if you want to use it then don't install vim using apt-get.
Ubuntu 13.10 has vim 7.4, compiling it from the source is not necessary.

Installing mupdf and rubber is recommended when editing LaTeX files:

    sudo apt-get mupdf rubber

When using vim for JS coding, install jshint (node required):

    sudo npm install -g jshint


Window Manager
--------------

### taffybar
Requires haskell-platform.
If you haven't already, you must install required gtk libraries:

    sudo apt-get install libgtk2.0-dev libpango1.0-dev libglib2.0-dev libcairo2-dev

taffybar requires gtk2hs-buildtools -- can be installed through cabal.
First you must install alex, happy and libxml2:

    sudo apt-get install alex happy
    sudo apt-get install libxml2-dev

Then install gtk2hs-buildtools:

    cabal install gtk2hs-buildtools

Before installing taffybar, a fix for cabal:

    sudo ln -s ~/.cabal/bin/gtk2hsC2hs /usr/bin/gtk2hsC2hs
    sudo ln -s ~/.cabal/bin/gtk2hsHookGenerator /usr/bin/gtk2hsHookGenerator
    sudo ln -s ~/.cabal/bin/gtk2hsTypeGen /usr/bin/gtk2hsTypeGen

Cairo won't compile unless you link gtk2hs* to /usr/bin.
You can now install taffybar:

    cabal install taffybar

### xmonad
Requires haskell-platform.
First install X11 dependencies:

    sudo apt-get install libxrandr-dev libxinerama-dev libxft-dev

Install xmonad from cabal - the cabal version is almost certainly newer than the one at apt-get repo.

    sudo cabal install xmonad xmonad-contrib

You need to install some applications if you want xmonad to be usable:

    sudo apt-get install feh rxvt-unicode dmenu xfonts-terminus console-terminus
    sudo apt-get install xcompmgr xscreensaver thunar network-manager-gnome

After xmonad, install some useful things:

    sudo apt-get install thunar-volman thunar-archive-plugin
    sudo apt-get install xbacklight


Various
-------

### git
Just install git

    sudo apt-get install git

### ibus
Install ibus-mozc and python-xlib:

    sudo apt-get install ibus-mozc python-xlib

### intellij idea
Unpack intellij archive to bin and run:

    ln -fs idea-* idea

### MATLAB
MATLAB requires libXp:

    sudo apt-get install libxp-dev

### mplayer
Install mplayer:

    sudo apt-get install mplayer


Restarting xmonad and/or taffybar
=================================
For restarting xmonad or taffybar:

    make restart-xmonad
    make restart-taffybar

Update .Xresources:

    make update-xresources

