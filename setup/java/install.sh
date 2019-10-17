#!/bin/bash

# Imports
source ${CFGROOT}/setup/setup-functions.sh

# Functions
install_java () {
    echo_yellow ">>> Installing Java ..."
    install_sdk java
}

install_maven () {
    echo_yellow ">>> Installing maven ..."
    install_sdk maven
}

# Main
install_java
install_maven

# TODO: gradle, scala, sbt

exit 0
