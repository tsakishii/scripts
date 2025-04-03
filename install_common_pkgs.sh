#!/bin/bash

set -eu -o pipefail # fail on error , debug all lines

sudo -n true
test $? -eq 0 || exit 1 "you should have sudo priveledge to run this script"

apt-get update
echo "Installing some applications I like"
while read -r pkg; do sudo apt-get install -y $pkg ; done < <(cat << EOF
alacritty
curl
extrepo
git-all
gnupg2
grimshot
htop
markdown
python3-dev
python3-pip
python3-setuptools
sqlite3
stow
sway
sway-backgrounds
swaybg
swayidle
swayimg
swaylock
sway-notification-center
texlive
texlive-latex-extra
waybar
wget
wofi
zsh
EOF
)
echo "press Ctrl+c to quit"
sleep 5

