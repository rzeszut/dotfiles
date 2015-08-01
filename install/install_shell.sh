#!/bin/bash

CFGROOT=$(pwd)

source $CFGROOT/shell/shell-functions.sh

echo "Installing shell scripts ..."
mkdir -p ${HOME}/bin
ln -fs $CFGROOT/scripts ${HOME}/bin/scripts

echo "Installing common shell config ..."
ln -fs $CFGROOT/shell/shell-path.sh ${HOME}/.shell-path
ln -fs $CFGROOT/shell/shell-aliases.sh ${HOME}/.shell-aliases
ln -fs $CFGROOT/shell/shell-env.sh ${HOME}/.shell-env
ln -fs $CFGROOT/shell/shell-functions.sh ${HOME}/.shell-functions

# Bash-specific section
echo "Installing bashrc ..."
ln -fs $CFGROOT/shell/bashrc ${HOME}/.bashrc

# Zsh-specific section -- only if zsh is available
cat << EOF
Optionally install zsh:

    sudo apt-get install zsh zsh-doc

EOF
read -n1 -r -p 'Press any key to continue...'

if (is_executable zsh); then
    if [[ ! -e $HOME/.oh-my-zsh ]]; then
        echo "Removing zsh config (if present) ..."
        unlink $HOME/.zshrc

        echo "Downloading Oh-My-Zsh ..."
        cd $HOME
        wget --no-check-certificate https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | bash
    fi

    echo "Installing zsh ..."
    ln -fs $CFGROOT/shell/zshrc $HOME/.zshrc
fi

