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
      emacs
      fonts-hack-ttf
      ghc
      git-all
      neofetch
      npm
      nodejs
      openjdk-17-doc
      openjdk-17-jdk
      openjdk-17-jre
      openjdk-17-source
      python3-dev
      python3-pip
      python3-setuptools
      ruby-full
      sqlite3
      stow
      texlive
      texlive-latex-extra
      wget
      zsh
EOF
)
echo press Ctrl+c to quit
sleep 5

