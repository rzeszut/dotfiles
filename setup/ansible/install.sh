#!/bin/bash

# Imports
source ${CFGROOT}/config/shell/shell-functions.sh

# Functions
install_common_properties () {
    echo_yellow ">>> Installing software-common-properties ..."
    sudo apt-get update -y
    sudo apt-get install -y software-properties-common
}

add_ansible_repo () {
    echo_yellow ">>> Adding ansible repositories ..."
    sudo apt-add-repository -y ppa:ansible/ansible
    sudo apt-get update -y
}

install_ansible () {
    echo_yellow ">>> Installing ansible ..."
    sudo apt-get install -y ansible
}

# Main
install_common_properties
add_ansible_repo
install_ansible

exit 0
