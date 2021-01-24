#!/bin/bash

function install_brew() {
    echo "Installing xcode tools"
    xcode-select --install

    echo "Installing brew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}


if ! command -v brew &> /dev/null
then
    install_brew
else
    echo "brew is already installed. Skipping."
fi

echo "Installing galaxy roles"
ansible-galaxy role install -r requirements.yml

echo "Installing galaxy collections"
ansible-galaxy collection install -r requirements.yml


if ! command -v ansible &> /dev/null
then 
    echo "Installing ansible via brew"
    brew install ansible
fi

echo "Installing tools"
ansible-playbook --ask-become-pass setup.yml
