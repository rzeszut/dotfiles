#!/bin/bash

#
# Exported dependencies list
#
DEPENDENCIES_SHELL="zsh zsh-doc"

#
# Exported installation function.
#
install_shell () {
    install_common_shell
    install_bash
    install_zsh
}

install_common_shell () {
    echo 'Installing shell scripts ...'
    mkdir -p $HOME/bin
    if [[ ! -e $HOME/bin/scripts ]]; then
        ln -fs $CFGROOT/scripts $HOME/bin/scripts
    fi

    echo 'Installing common shell config ...'
    ln -fs $CFGROOT/shell/shell-path.sh $HOME/.shell-path
    ln -fs $CFGROOT/shell/shell-aliases.sh $HOME/.shell-aliases
    ln -fs $CFGROOT/shell/shell-env.sh $HOME/.shell-env
    ln -fs $CFGROOT/shell/shell-functions.sh $HOME/.shell-functions
}

install_bash () {
    echo 'Installing bash config ...'
    ln -fs $CFGROOT/shell/bashrc $HOME/.bashrc
}

print_zsh_install_message () {
    cat << EOF
Optionally install zsh:

sudo apt-get install $DEPENDENCIES_SHELL

EOF
    read -n1 -r -p 'Press any key to continue...'
}

install_zsh () {
    if (is_not_executable zsh); then
        print_zsh_install_message
    fi

    if (is_executable zsh); then
        if [[ ! -e $HOME/.oh-my-zsh ]]; then
            echo 'Removing zsh config (if present) ...'
            unlink $HOME/.zshrc

            echo 'Downloading Oh-My-Zsh ...'
            cd $HOME
            wget --no-check-certificate https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | bash
        fi

        echo 'Installing zsh config ...'
        ln -fs $CFGROOT/shell/zshrc $HOME/.zshrc
    fi
}

#
# Exported uninstallation function.
#
uninstall_shell () {
    uninstall_common_shell
    uninstall_bash
    uninstall_zsh
}

uninstall_common_shell () {
    echo 'Uninstalling common shell config ...'
    unlink $HOME/.shell-path
    unlink $HOME/.shell-aliases
    unlink $HOME/.shell-env
    unlink $HOME/.shell-functions
    unlink $HOME/bin/scripts
}

uninstall_bash () {
    echo 'Uninstalling bash config ...'
    unlink $HOME/.bashrc
}

uninstall_zsh () {
    echo 'Uninstalling zsh config ...'
    unlink $HOME/.zshrc
    unlink $HOME/.oh-my-zsh
}

