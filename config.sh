#!/bin/bash

CFGROOT=$(pwd)/$(dirname $0)
PROGRAM_NAME=$(basename $0)
APPLICATIONS=($(ls $CFGROOT/install/*.sh | xargs basename -a | cut -d. -f1))

main () {
    if [[ $# -ne 2 ]]; then
        print_usage
        exit 1
    fi

    local operation=$1
    local application=$2

    validate_application $application
    import_install_scripts

    case $operation in
        install-dependencies)
            call_apt install $application
            ;;

        install)
            eval "install_$application"
            ;;

        uninstall)
            eval "uninstall_$application"
            ;;

        uninstall-dependencies)
            call_apt purge $application
            ;;

        *)
            echo "Invalid command: $operation"
            print_usage
            exit 3
    esac
}

print_usage () {
    echo "Usage $PROGRAM_NAME (install-dependencies|install|uninstall|uninstall-dependencies) ($(echo ${APPLICATIONS[@]} | tr \  \|))"
}

validate_application () {
    local application=$1

    for app in ${APPLICATIONS[@]}; do
        [[ $app == $application ]] && return
    done

    echo "Application '$application' is not supported by this script."
    exit 2
}

import_install_scripts () {
    source $CFGROOT/shell/shell-functions.sh

    for s in $CFGROOT/install/*.sh; do
        source $s
    done
}

call_apt () {
    local operation=$1
    local application=$2
    local dependencies_var="DEPENDENCIES_${application^^}"
    local sudo=''

    if [[ $(id -u ) -ne 0 ]]; then
        local sudo='sudo'
    fi

    $sudo apt-get $operation ${!dependencies_var}
}

main $@

