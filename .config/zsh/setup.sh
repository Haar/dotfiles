#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# NOTE: WIP - Quick and nasty to get another machine setup, please refactor.
echo "-- Moving existing .zshrc to .zshrc.old"
cp ~/.zshrc ~/.zshrc.old
echo "-- Installing .zshrc"
ln -s $SCRIPT_DIR/.zshrc ~/.zshrc
ln -s $SCRIPT_DIR/.overrides.zsh ~/.overrides.zsh
touch ~/.private.zsh
mkdir -p ~/.config/antibody
ln -s $SCRIPT_DIR/antibody/source.txt ~/.config/antibody/source.txt
source ~/.zshrc
echo "-- Installing ZSH dependencies via antibody"
antibody bundle < ~/.config/antibody/source.txt > ~/.config/antibody/compiled.sh
