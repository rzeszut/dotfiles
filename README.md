dotfiles
========

Installing
----------
For installing all the dotfiles just type

    make

For installing one specific configuration, e.g.

    make -B vim

To uninstall the config

    make -B uninstall

Prerequisites
-------------

### clojure
Install clojure and leiningen 2:

    sudo apt-get install clojure leiningen
    
If lein2 is not available, use the download script from [here](http://leiningen.org/).
Note: when using emacs with clojure, start it from terminal by hand (no dmenu!). Otherwise, it can't see leiningen executable and nrepl fails.

### emacs
Install emacs 24 uisng instructions from [emacs-wiki](http://wikemacs.org/wiki/Installing_Emacs_on_GNU/Linux).

### git
Just install git

    sudo apt-get install git

### haskell-platform
For xmonad and taffybar you're gonna need ghc and cabal. Run

    sudo apt-get install ghc cabal
    sudo cabal update

### ibus
Install ibus-mozc and python-xlib:

    sudo apt-get install ibus-mozc python-xlib

### octave
Just install octave:

    sudo apt-get install octave

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

### taffybar
Requires haskell-platform.
If you haven't already, you must install required gtk libraries:

    sudo apt-get install libgtk2.0-dev libpango1.0-dev
    sudo apt-get install libglib2.0-dev libcairo2-dev
    
taffybar requires gtk2hs-buildtools -- can be installed through cabal.
First you must install alex and happy:

    sudo apt-get install alex happy

Then install gtk2hs-buildtools:

    sudo cabal install gtk2hs-buildtools

Before installing taffybar, a fix for cabal:

    sudo ln -s ~/.cabal/bin/gtk2hsC2hs /usr/bin/gtk2hsC2hs
    sudo ln -s ~/.cabal/bin/gtk2hsHookGenerator /usr/bin/gtk2hsHookGenerator
    sudo ln -s ~/.cabal/bin/gtk2hsTypeGen /usr/bin/gtk2hsTypeGen

Cairo won't compile unless you link gtk2hs* to /usr/bin.
You can now install taffybar:

    sudo cabal install taffybar

### vim
Requires git.
Install vim (preferably gvim)

    sudo apt-get install gvim

Then install the vundle packages

    :BundleInstall

### xmonad
Requires haskell-platform.
Install xmonad from cabal - the cabal version is almost certainly newer than the one at apt-get repo.

    sudo cabal install xmonad xmonad-contrib

Restarting xmonad and/or taffybar
---------------------------------
For restarting xmonad or taffybar:

    make restart-xmonad
    make restart-taffyvar

Update .Xresources:

    make update-xresources
