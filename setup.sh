#!/usr/bin/env bash

echo "Installing Homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo "Installing dependencies via Homebrew"
/opt/homebrew/bin/brew bundle install ./Brewfile
echo "Setting up ZSH"
./.config/zsh/setup.sh
echo "Setting up Neovim"
mkdir -p ~/.config

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

ln -s $SCRIPT_DIR/.config/nvim ~/.config/nvim

echo <<- EOM
TODO:
  Install
    - Wavelink
      https://www.elgato.com/en/downloads
      https://help.elgato.com/hc/en-us/articles/360057309711-Installing-Wave-Link-on-Mac-with-Apple-Silicon
EOM
