#!/bin/bash

# Imports
source ${CFGROOT}/config/shell/shell-functions.sh

# Functions
configure_common_shell () {
    echo_yellow ">>> Installing shell scripts ..."
    mkdir -p $HOME/bin
    if [[ ! -e $HOME/bin/scripts ]]; then
        ln -fs $CFGROOT/scripts $HOME/bin/scripts
    fi

    echo_yellow ">>> Configuring common shell settings ..."
    ln -fs $CFGROOT/config/shell/shell-path.sh $HOME/.shell-path
    ln -fs $CFGROOT/config/shell/shell-aliases.sh $HOME/.shell-aliases
    ln -fs $CFGROOT/config/shell/shell-env.sh $HOME/.shell-env
    ln -fs $CFGROOT/config/shell/shell-functions.sh $HOME/.shell-functions
}

configure_bash () {
    echo_yellow ">>> Configuring bash ..."
    ln -fs $CFGROOT/config/shell/bashrc $HOME/.bashrc
}

configure_zsh () {
    if [[ ! -e $HOME/.oh-my-zsh ]]; then
        echo_yellow '>>> Removing zsh config (if present) ...'
        unlink $HOME/.zshrc

        echo_yellow '>>> Downloading Oh-My-Zsh ...'
        cd $HOME
        wget --no-check-certificate\
            https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | bash
    fi

    echo_yellow ">>> Configuring zsh ..."
    ln -fs $CFGROOT/config/shell/zshrc $HOME/.zshrc
}

set_zsh_as_default () {
    echo_yellow ">>> Setting zsh as default shell ..."
    chsh -s $(which zsh)
}

# Main
configure_common_shell
configure_bash

prompt ">>> Do you want to configure zsh?" font_yellow font_normal &&\
    configure_zsh

prompt ">>> Do you want to set zsh as default shell?" font_yellow font_normal &&\
    set_zsh_as_default

exit 0

