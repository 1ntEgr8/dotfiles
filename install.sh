#!/usr/bin/env bash

function not_supported ()
{
    echo "This operating system is not supported yet" >&2
    return 1
}

function section ()
{
    echo -e "=== \x1b[37;1msection \x1b[34;1m$1\x1b[m ==="
}

function installing ()
{
    echo -e "\x1b[35;1minstalling \x1b[32;1m$1\x1b[m"
}

function linking ()
{
    echo -e "\x1b[33;1mlinking config files\x1b[m"
}

function success ()
{
    echo -e "\x1b[32;1mdone 🎉\x1b[m\n"
}

function install_mac_fish ()
{
    installing "fish"
    fish --version 1>/dev/null || brew install fish
    
    linking
    rm -rf "$HOME/.config/fish"
    ln -sF "$cwd/shell/fish" "$HOME/.config/fish" 

    success
}

function install_mac_tmux ()
{
    installing "tmux"
    tmux -V 1>/dev/null || brew install tmux

    linking
    ln -sF "$cwd/shell/tmux/tmux.conf" "$HOME/.tmux.conf"

    success
}

function install_mac_alacritty ()
{
    installing "alacritty"
    brew cask install alacritty 2>/dev/null

    linking
    ln -sF "$cwd/shell/alacritty/alacritty.yaml" "$HOME/.alacritty.yaml"

    success
}

function install_mac_nvim ()
{
    installing "nvim"
    nvim --version 1>/dev/null || brew install nvim

    linking
    echo "TODO"

    success
}

function install_mac_neomutt ()
{
    installing "neomutt"
    neomutt -v 1>/dev/null || brew install neomutt

    linking
    echo "TODO"

    success
}

function install_mac_amethyst ()
{
    installing "amethyst"
    brew cask install amethyst 2>/dev/null

    linking
    ln -sF "$cwd/gui/amethyst/amethyst" "$HOME/.amethyst"

    success
}

function install_mac ()
{
    cwd=$(pwd)
    echo -e "installing for mac\n"

    brew --version 1>/dev/null || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

    section "shell"
    install_mac_fish
    install_mac_tmux
    install_mac_alacritty
    
    section "editor"
    install_mac_nvim
    
    section "mail"
    install_mac_neomutt
    
    section "gui"
    install_mac_amethyst
    
    return 0
}

case "$OSTYPE" in
    "darwin"*) install_mac ;;
    *) not_supported ;;
esac

