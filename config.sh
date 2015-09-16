#!/bin/bash

CFGROOT=$(pwd)/$(dirname $0)
PROGRAM_NAME=$(basename $0)

print_usage () {
    echo "Usage $PROGRAM_NAME (shell|vim|vimperator|git|ranger|i3|all) (install|uninstall)"
}

if [[ $# -ne 2 ]]; then
    print_usage
    exit 1
fi

APPLICATION=$1
OPERATION=$2

install_application () {
    local app=$1

    bash $CFGROOT/install/install_$app.sh $OPERATION
}

case $APPLICATION in
    shell)
        install_application shell
        ;;

    vim)
        install_application vim
        ;;

    vimperator)
        install_application vimperator
        ;;

    git)
        install_application git
        ;;

    ranger)
        install_application ranger
        ;;

    i3)
        install_application i3
        ;;

    all)
        install_application shell
        install_application git
        install_application vim
        install_application ranger
        install_application i3
        install_application vimperator
        ;;

    *)
        print_usage
esac

