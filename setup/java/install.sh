#!/bin/bash

# Imports
source ${CFGROOT}/config/shell/shell-functions.sh

# Functions
purge_openjdk () {
    echo_yellow ">>> Purging OpenJDK ..."
    sudo apt-get purge -y openjdk*
}

add_oracle_repo () {
    echo_yellow ">>> Adding Oracle Java repositories ..."
    sudo add-apt-repository -y ppa:webupd8team/java
    sudo apt-get update -y
}

install_java7 () {
    echo_yellow ">>> Installing Java 7 ..."
    sudo apt-get install -y oracle-java7-installer
}

install_java8 () {
    echo_yellow ">>> Installing Java 8 ..."
    sudo apt-get install -y oracle-java8-installer
}

install_java9 () {
    echo_yellow ">>> Installing Java 9 ..."
    sudo apt-get install -y oracle-java9-installer
}

# Main
purge_openjdk
add_oracle_repo

prompt ">>> Do you want to install Java 7?" font_yellow font_normal &&\
    install_java7

prompt ">>> Do you want to install Java 8?" font_yellow font_normal &&\
    install_java8

prompt ">>> Do you want to install Java 9?" font_yellow font_normal &&\
    install_java9

exit 0
