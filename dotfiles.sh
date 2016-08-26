#!/bin/bash

# Constants
# CFGROOT is used by the setup scripts
export CFGROOT=$(pwd)/$(dirname $0)

PROGRAM_NAME=$(basename $0)

# Functions
main () {
    if [[ $# -ne 2 ]]; then
        print_usage "Invalid number of arguments."
        exit 0
    fi

    local application=$1
    local operation=$2
    local app_dir=${CFGROOT}/setup/${application}
    local path=${app_dir}/${operation}.sh

    if [[ ! -d "$app_dir" ]]; then
        print_usage "Invalid application."
        exit 1
    fi

    if [[ ! -f "$path" ]]; then
        print_usage "Invalid operation."
        exit 2
    fi

    bash $path
}

print_usage () {
    local message=$1

    source ${CFGROOT}/config/shell/shell-functions.sh

    echo_red $message
    echo

    echo "Usage $PROGRAM_NAME <application> <operation>"
    echo
    echo "Applications supported:"
    for app in $(ls $CFGROOT/setup); do
        echo "* $app"
    done
    echo
    echo "Operations supported (not for every application):"
    echo "* install -- install required packages"
    echo "* configure -- set up configuration files"
}

# Main
main $@

exit 0

