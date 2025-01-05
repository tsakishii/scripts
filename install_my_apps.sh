#!/bin/bash

set -eu -o pipefail # fail on error , debug all lines

sudo -n true
test $? -eq 0 || exit 1 "you should have sudo priveledge to run this script"

LIST_OF_APPS=""

apt-get update
echo "Installing some applications I like"
while read -r p; do sudo apt-get install -y $p ; done < <(cat << EOF
      alacritty
      curl
      fonts-hack-ttf
      git-all
      grimshot
      htop
      markdown
      openjdk-21-doc
      openjdk-21-jdk
      openjdk-21-jre
      openjdk-21-source
      postgresql
      postgresql-contrib
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
      texlive
      texlive-latex-extra
      vi
      waybar
      wget
      wofi
      zsh
EOF
)
echo press Ctrl+c to quit
sleep 5

