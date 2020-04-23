#!/usr/bin/env bash

if [[ "$OSTYPE" == "darwin"* ]]; then
    brew --version >/dev/null 2>&1 ||
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

curr_dir=$(pwd)
cd "$HOME" || exit

# installing software
# TODO
# make a list of barebones
# if the os is mac, install brew

chmod +x "$curr_dir/vim/install.sh"
vim/install.sh
# install vim/neovim
# install tmux
# install brave
# install bitwarden
# install rust
# install golang
# make a list of complete

# symlinks
ln -si  "$curr_dir/alacritty/alacritty.yml" "$HOME/.alacritty.yml" && 
echo "alacritty config linked"

ln -si "$curr_dir/tmux/tmux.conf" "$HOME/.tmux.conf" && 
echo "tmux config linked"

ln -si "$curr_dir/vim/.vim" "$HOME/.vim" &&
ln -si "$curr_dir/vim/.vimrc" "$HOME/.vimrc" &&
echo "vim config linked"

echo "$OSTYPE"
# install the plugins
