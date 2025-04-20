#!/bin/bash

packages=(
    "sway"
    "sway-backgrounds"
    "sway-notification-center"
    "swaybg"
    "swayidle"
    "swayimg"
    "swaylock"
)

install_packages() {
    if [ ! "$UID" -eq 0 ]; then
        echo "Error! Run script as root please!"
        exit 1
    else
        for pkg in ${packages[@]};
        do
            sudo apt install $pkg -y
        done
    fi
}

install_packages
