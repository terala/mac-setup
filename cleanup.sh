#!/bin/bash

# Globally installed group
declare -a apps=(
    "Docker"
    "draw.io"
    "Enterprise Connect"
    "Vagrant Manager"
    "VirtualBox"
    "Google Chrome"
    "Firefox"
)

# Remove installed app
for app in "${apps[@]}";
do
    echo "Uninstalling app '$app'"
    rm -rf "/Applications/$app.app"
done
