#!/bin/bash

echo "Installing the latest alacritty..."

if ! command -v git &> /dev/null; then
    echo "Git is not installed. Attempting to install Git.."

    if command -v apt &> /dev/null; then
        sudo apt update
        sudo apt install git-all -y
    else
        echo "Cannot install Git automatically using apt."
        exit 1
    fi
fi

echo "Git installed. Cloning the repository"
if [ ! -d ~/code ]; then
    mkdir ~/code
fi
git clone https://github.com/alacritty/alacritty.git ~/code/alacritty

#Install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

rustup override set stable
rustup update stable


apt install cmake g++ pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3

cargo build --release --no-default-features --features=wayland
