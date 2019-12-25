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

# stow ;; to setup the symlinks
brew install stow

# oh-my-fish
curl -L https://get.oh-my.fish > install
fish install --path=~/.local/share/omf --config=~/.config/omf

# setting up symlinks
stow * -v -t ~

