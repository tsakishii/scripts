#!/bin/bash

echo "Starting up Audio packages install script..."

packages=(
    "pavucontrol"
    "pipewire"
    "pipewire-alsa"
    "pipewire-audio-client-libraries"
    "pipewire-avb"
    "pipewire-bin"
    "pipewire-jack"
    "pipewire-pulse"
    "pulseaudio-utils"
    "pamixer"
    "wireplumber"
)

is_user_root() {
    if [ ! "$UID" -eq 0 ]; then
        echo "Error! Run script as root please!"
        exit 1
    fi
}

install_audio_packages() {
    is_user_root

    local pkgs=("$@")
    local pkgs_to_install=()

    for pkg in "${pkgs[@]}"; do
        if ! dpkg -l | grep -q " $pkg "; then
            pkgs_to_install+=("$pkg")
        fi
    done

    if [ ${#pkgs_to_install[@]} -gt 0 ]; then
        echo "Installing packages: ${pkgs_to_install[@]}"
        apt update
        apt install -y "${pkgs_to_install[@]}"
        if [ $? -ne 0 ]; then
            echo "Failed to install ${pkgs_to_install[@]}. Exiting."
            exit 1
        fi
    else
        echo "All packages already installed on system"
    fi
}

install_audio_packages "${packages[@]}"
