#!/bin/bash

BRC_FILE=.bashrc
BPRO_FILE=.bash_profile

[ "$UID" -eq 0 ] || exec sudo "$0" "$@"

# ? zsh installed
if ! command -v zsh 2>&1 >/dev/null; then
    echo "Zsh not found. Please install zsh."
    exit 1
fi

# ? stow installed
if ! command -v stow 2>&1 >/dev/null; then
    echo "GNU Stow not found. Please install GNU Stow."
    exit 1
fi

# backup bashrc
if [[ -f ~/${BRC_FILE} ]]; then
    mv ~/${BRC_FILE} ~/$BRC_FILE+=".bak"
fi

# backup bashrc
if [[ -f ~/${BPRO_FILE} ]]; then
    mv ~/${BPRO_FILE} ~/$BPRO_FILE+=".bak"
fi

# ? dotfiles cloned
# if [[ ! -d ~/dotfiles ]]; then
#     echo "Listen here buddy! I will clone your dotfiles!"
#     cd
#     git clone https://github.com/tsakishii/dotfiles.git
#     cd dotfiles
# fi
