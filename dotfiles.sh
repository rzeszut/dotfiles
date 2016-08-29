#!/bin/bash

# Constants
# CFGROOT is used by the setup scripts
export CFGROOT=$(pwd)/$(dirname $0)

PROGRAM_NAME=$(basename $0)

# Imports
source ${CFGROOT}/config/shell/shell-functions.sh

# Functions
print_usage_basic () {
    local message=$1

    echo_red $message
    echo
    echo "Usage $PROGRAM_NAME <application> <operation>"
}

print_usage_applications () {
    echo
    echo "Applications supported:"
    for app in $(ls $CFGROOT/setup); do
        echo "* $app"
    done
}

print_usage_operations () {
    local application=$1

    echo
    echo "Operations supported:"
    for op in $(ls $CFGROOT/setup/${application}); do
        echo "* $(basename $op .sh)"
    done
}

# Main
application=$1
operation=$2

if [[ $# -lt 1 ]]; then
    print_usage_basic "Invalid number of arguments."
    print_usage_applications
    exit 0
fi
if [[ $# -lt 2 ]]; then
    print_usage_basic "Invalid number of arguments."
    print_usage_operations $application
    exit 0
fi

app_dir=${CFGROOT}/setup/${application}
path=${app_dir}/${operation}.sh

if [[ ! -d "$app_dir" ]]; then
    print_usage_basic "Invalid application."
    print_usage_applications
    exit 1
fi
if [[ ! -f "$path" ]]; then
    print_usage $application "Invalid operation."
    print_usage_operations $application
    exit 2
fi

bash $path

exit 0

