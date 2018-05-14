#!/bin/bash

# Imports
source ${CFGROOT}/config/shell/shell-functions.sh

# Functions
install_rust () {
    local script=$(mktemp)
    echo_yellow ">>> Installing Rust & Cargo ..."
    curl https://sh.rustup.rs -sSf > ${script}
    sh ${script} -y
    rm ${script}
}

install_racer () {
    echo_yellow ">>> Installing Racer (code completion & navigation utility) ..."
    cargo install racer
}

download_rust_sources() {
    echo_yellow ">>> Downloading Rust language sources ..."
    mkdir -p ${HOME}/tmp/rustsrc/
    git clone git@github.com:rust-lang/rust.git ${HOME}/tmp/rustsrc/rust-lang
}

# Main
install_rust
install_racer
download_rust_sources

exit 0
