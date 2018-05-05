# user scripts and application directory
PATH=$PATH:$HOME/.local/bin
PATH=$PATH:$HOME/bin/scripts

# cabal and haskell applications
if [[ -d $HOME/.cabal ]]; then
    PATH=$PATH:/$HOME/.cabal/bin
fi

# scala & sbt
if [[ -d $HOME/bin/scala ]]; then
    PATH=$PATH:$HOME/bin/scala/bin
fi
if [[ -d $HOME/bin/sbt ]]; then
    PATH=$PATH:$HOME/bin/sbt/bin
fi

# play framework
if [[ -d $HOME/bin/play ]] ; then
    PATH=$PATH:$HOME/bin/play
fi

# maven and gradle
if [[ -d $HOME/bin/maven ]]; then
    PATH=$PATH:$HOME/bin/maven/bin
fi
if [[ -d $HOME/bin/gradle ]]; then
    PATH=$PATH:$HOME/bin/gradle/bin
fi

# IDEs
if [[ -d $HOME/bin/eclipse ]]; then
    PATH=$PATH:$HOME/bin/eclipse
fi
if [[ -d $HOME/bin/idea ]]; then
    PATH=$PATH:$HOME/bin/idea/bin
fi
if [[ -d $HOME/bin/pycharm ]]; then
    PATH=$PATH:$HOME/bin/pycharm/bin
fi
if [[ -d $HOME/bin/clion ]]; then
    PATH=$PATH:$HOME/bin/clion/bin
fi

# Eclipse memory analyzer tool
if [[ -d $HOME/bin/mat ]]; then
    PATH=$PATH:$HOME/bin/mat
fi

# nvidia cuda
if [[ -d /usr/local/cuda/bin ]]; then
    PATH=$PATH:/usr/local/cuda/bin
fi

# heroku
if [[ -d /usr/local/heroku ]]; then
    PATH=$PATH:/usr/local/heroku/bin
fi

# android sdk
if [[ -d $HOME/bin/android-sdk-linux ]]; then
    PATH=$PATH:$HOME/bin/android-sdk-linux/tools
fi

# Teamspeak
if [[ -d $HOME/bin/teamspeak ]]; then
    PATH=$PATH:$HOME/bin/teamspeak
fi

# RSSOwl
if [[ -d $HOME/bin/rssowl ]]; then
    PATH=$PATH:$HOME/bin/rssowl
fi

export PATH

