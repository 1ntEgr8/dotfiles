#!/usr/bin/env bash

if [[ "$OSTYPE" == "darwin"* ]]; then
    brew --version >/dev/null 2>&1 ||
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

curr_dir=$(pwd)
cd "$HOME" || exit

