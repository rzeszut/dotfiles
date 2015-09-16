#!/bin/bash

CFGROOT=$(dirname $0)/..
PROGRAM_NAME=$(basename $0)

source $CFGROOT/shell/shell-functions.sh

install_common_shell () {
    echo 'Installing shell scripts ...'
    mkdir -p $HOME/bin
    ln -fs $CFGROOT/scripts $HOME/bin/scripts

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

sudo apt-get install zsh zsh-doc

EOF
    read -n1 -r -p 'Press any key to continue...'
}

install_zsh () {
    print_zsh_install_message

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

case $1 in
    install)
        install_common_shell
        install_bash
        install_zsh
        ;;

    uninstall)
        uninstall_zsh
        uninstall_bash
        uninstall_common_shell
        ;;

    *)
        echo "Usage $PROGRAM_NAME (install|uninstall)"
esac

