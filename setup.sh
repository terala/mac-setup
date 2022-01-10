#!/bin/bash

function install_xcode_commandline_tools() {
    echo -n "Installing XCode commandline tools : "

    xcode-select -p 1>/dev/null
    xcode_installed=$?
    if [ $xcode_installed -eq 2 ];
    then
        echo "Installing xcode tools"
        xcode-select --install
        echo "[ Installed ]"
    else
        echo "[ Skipping ]"
    fi
}

function install_brew() {
    echo -n "Installing brew :                  "
    if ! command -v brew &> /dev/null
    then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        echo "[ Installed ]"
    else
        echo "[ Skipping ]"
    fi
}

function install_ansible() {
    echo -n "Installing ansible :               "

    if ! command -v ansible &> /dev/null
    then
        brew install ansible
        echo "[ Installed ]"
    else
        echo "[ Skipping ]"
    fi
}

echo "PATH="$PATH
export PATH=$PATH:/opt/homebrew/bin

install_xcode_commandline_tools
install_brew
install_ansible

SCRIPT_DIR=$(dirname "$0")
pushd $SCRIPT_DIR

echo "Installing galaxy roles"
ansible-galaxy role install -r requirements.yml

echo "Installing galaxy collections"
ansible-galaxy collection install -r requirements.yml

echo "Installing tools"
ansible-playbook --ask-become-pass setup.yml

popd
