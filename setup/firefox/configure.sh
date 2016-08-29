#!/bin/bash

# Imports
source ${CFGROOT}/config/shell/shell-functions.sh

# Constants
FIREFOX_PATH=${HOME}/.mozilla/firefox
FIREFOX_PROFILE=$(cat ${FIREFOX_PATH}/profiles.ini | grep "Path=" | cut -d= -f2)
FIREFOX_PROFILE_PATH=${FIREFOX_PATH}/{$FIREFOX_PROFILE}
FIREFOX_EXT_PATH=${FIREFOX_PROFILE_PATH}/extensions

# Functions
configure_vimperator () {
    echo_yellow '>>> Configuring vimperator ...'
    ln -fs ${CFGROOT}/config/firefox/vimperatorrc ${HOME}/.vimperatorrc

    mkdir -p ${HOME}/.vimperator/colors
    for file in ${CFGROOT}/config/firefox/colors/*.vimp; do
        ln -fs $file ${HOME}/.vimperator/colors/
    done
}

install_user_js () {
    echo_yellow ">>> Installing user.js settings ..."
    ln -fs ${CFGROOT}/config/firefox/user.js ${FIREFOX_PROFILE_PATH}/user.js
}

install_firefox_extensions () {
    echo_yellow ">>> Installing Firefox extensions ..."
    mkdir -p /tmp/firefox-install-extensions
    cd /tmp/firefox-install-extensions

    install_extension "uBlock"\
        https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/addon-607454-latest.xpi
    install_extension "uMatrix"\
        https://addons.mozilla.org/firefox/downloads/latest/umatrix/addon-613250-latest.xpi
    install_extension "Vimperator"\
        https://addons.mozilla.org/firefox/downloads/file/450078/vimperator-latest-fx.xpi
    install_extension "Tab Groups"\
        https://addons.mozilla.org/firefox/downloads/latest/tab-groups-panorama/addon-671381-latest.xpi
    install_extension "Cookies Manager+"\
        https://addons.mozilla.org/firefox/downloads/latest/cookies-manager-plus/addon-92079-latest.xpi

    rm -rf /tmp/firefox-install-extensions
}

install_extension () {
    local ext_name=$1
    local ext_url=$2

    echo_yellow ">>> Installing ${ext_name} ..."

    rm addon.xpi
    wget -O addon.xpi "${ext_url}"
    local ext_uid=$(unzip -p addon.xpi install.rdf | grep "<em:id>" | head -n 1 | sed 's/^.*>\(.*\)<.*$/\1/g')

    cp -f addon.xpi "${FIREFOX_EXT_PATH}/${ext_uid}.xpi"
    unzip addon.xpi -d "${FIREFOX_EXT_PATH}/${ext_uid}"
}

# Main
configure_vimperator
install_user_js

font_yellow &&\
    prompt ">>> Do you want to install Firefox extensions?" &&\
    font_normal &&\
    install_firefox_extensions

exit 0

