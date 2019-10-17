#!/bin/bash

# Imports
source ${CFGROOT}/config/shell/shell-functions.sh

# Functions
install_package () {
    if [[ "$1" == "--cask" ]]
    then
        local cask="cask"
        shift
    else
        local cask=""
    fi
    local package=$1

    if (is_macos && is_executable brew)
    then
        brew ${cask} install ${package}
    elif (is_linux)
    then
        sudo apt-get install -y ${package}
    else
        echo_red "ERROR: system unsupported"
        exit 1
    fi
}

install_on_macos () {
    if [[ "$1" == "cask" ]]
    then
        local cask="cask"
        shift
    else
        local cask=""
    fi
    local package=$1

    if (is_macos)
    then
        if (is_executable brew)
        then
            brew ${cask} install ${package}
        else
            # TODO: maybe install homebrew here?
            echo_red "ERROR: you must install brew first."
            exit 1
        fi
    fi
}

install_on_linux () {
    if (is_linux)
    then
        sudo apt-get install -y $@
    fi
}

install_sdk () {
    if (is_not_executable sdk)
    then
        echo_red "ERROR: you must install sdk first"
        exit 1
    fi

    sdk install $1
}
