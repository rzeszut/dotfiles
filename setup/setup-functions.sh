#!/bin/bash

# Imports
source ${CFGROOT}/config/shell/shell-functions.sh

# Variables
_PACKAGE_NAME=
_MACOS_PACKAGE_NAME=
_MACOS_CASK=

# Functions
install_package () {
    __private_parse_arguments "$@"
    if (is_macos)
    then
        __private_install_on_macos
    elif (is_linux)
    then
        __private_install_on_linux
    else
        echo_red "ERROR: system unsupported"
        exit 1
    fi
}

install_on_macos() {
    if (is_macos)
    then
        __private_parse_arguments "$@"
        __private_install_on_macos
    fi
}

install_on_linux() {
    if (is_linux)
    then
        sudo apt-get install -y "$@"
    fi
}

__private_parse_arguments() {
    _MACOS_CASK=""
    _PACKAGE_NAME=""
    _MACOS_PACKAGE_NAME=""

    while [[ $# > 0 ]]
    do
        case $1 in
            --cask)
                _MACOS_CASK="cask"
                shift
                ;;

            --macos)
                _MACOS_PACKAGE_NAME="$2"
                shift 2
                ;;

            *)
                _PACKAGE_NAME="$1"
                shift
                ;;
        esac
    done

    if [[ -z "$_MACOS_PACKAGE_NAME" ]]
    then
        _MACOS_PACKAGE_NAME="$_PACKAGE_NAME"
    fi
}

__private_install_on_macos () {
    if (is_not_executable brew)
    then
        # TODO: maybe install homebrew here?
        echo_red "ERROR: you must install brew first."
        exit 1
    fi

    brew "$_MACOS_CASK" install "$_MACOS_PACKAGE_NAME"
}

__private_install_on_linux () {
    sudo apt-get install -y "$_PACKAGE_NAME"
}

install_sdk () {
    __private_load_sdk
    if (is_not_executable sdk)
    then
        echo_yellow ">>> Installing sdkman first ..."
        curl -s "https://get.sdkman.io" | bash
        __private_load_sdk
    fi

    sdk install $1
}

__private_load_sdk () {
    (is_not_executable sdk) &&\
        [[ -s "${HOME}/.sdkman/bin/sdkman-init.sh" ]] &&\
        source "${HOME}/.sdkman/bin/sdkman-init.sh"
}
