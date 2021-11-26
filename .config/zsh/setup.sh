# NOTE: WIP - Quick and nasty to get another machine setup, please refactor.
echo "-- Moving existing .zshrc to .zshrc.old"
cp ~/.zshrc ~/.zshrc.old
echo "-- Installing .zshrc"
ln -s ./.zshrc ~/.zshrc
ln -s ./.overrides.zsh ~/.overrides.zsh
touch ~/.private.zsh
ln -s ./antibody/source.txt ~/.config/antibody/source.txt
echo "-- Installing ZSH dependencies via antibody"
antibody bundle < ~/.config/antibody/source.txt > ~/.config/antibody/compiled.sh
