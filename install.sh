#!/bin/bash

BASE_DIR=$HOME

# installing brew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# git
brew install git

# vim
brew install vim

# fish
brew install fish

# symlinks
ln -s ./vim/.vimrc "${BASE_DIR}/.vimrc"
ln -s ./tmux/.tmux.conf "${BASE_DIR}/.tmux.conf"
mkdir "${BASE_DIR}/.config"
ln -s ./fish/.config/omf "${BASE_DIR}/.config/omf" 

# oh-my-fish
curl -L https://get.oh-my.fish > install
fish install --path=~/.local/share/omf --config=~/.config/omf

