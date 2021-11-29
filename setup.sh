echo "Installing Homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo "Installing dependencies via Homebrew"
brew bundle install ./Brewfile
echo "Setting up ZSH"
./.config/zsh/setup.sh
echo "Setting up Neovim"
mkdir -p ~/.config
ln -s ./.config/nvim ~/.config/nvim

echo <<- EOM
TODO:

  Install
    - AppCleaner
    - Spectacle
    - Spotify
    - Hidden Bar
    - Hemingway
    - Karabiner-Elements(? If no esc key)
    - Obsidian
    - Noizio
    - Wavelink
EOM


