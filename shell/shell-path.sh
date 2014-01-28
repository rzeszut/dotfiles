# user scripts and application directory
PATH=$PATH:$HOME/bin:$HOME/bin/scripts

# cabal and haskell applications
if [ -e $HOME/.cabal ]; then
    PATH=$PATH:/$HOME/.cabal/bin
fi

# scala & sbt
if [ -e $HOME/bin/scala ]; then
    PATH=$PATH:$HOME/bin/scala/bin
fi
if [ -d $HOME/bin/sbt ]; then
    PATH=$PATH:$HOME/bin/sbt/bin
fi

# play framework
if [ -e $HOME/bin/play ] ; then
    PATH=$PATH:$HOME/bin/play
fi

# maven
if [ -e $HOME/bin/maven ]; then
    PATH=$PATH:$HOME/bin/maven/bin
fi

# IDEs
if [ -e $HOME/bin/eclipse ]; then
    PATH=$PATH:$HOME/bin/eclipse
fi
if [ -e $HOME/bin/idea ]; then
    PATH=$PATH:$HOME/bin/idea/bin
fi
if [ -e $HOME/bin/pycharm ]; then
    PATH=$PATH:$HOME/bin/pycharm/bin
fi

# matlab path
if [ -e /usr/local/MATLAB/R2011a/bin ]; then
    PATH=$PATH:/usr/local/MATLAB/R2011a/bin
fi

# nvidia cuda
if [ -e /usr/local/cuda/bin ]; then
    PATH=$PATH:/usr/local/cuda/bin
fi

# heroku
if [ -e /usr/local/heroku ]; then
    PATH=$PATH:/usr/local/heroku/bin
fi

export PATH