#!/usr/bin/env zsh

# Get current dir (so run this script from anywhere)

export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${(%):-%N}" )" && pwd )"

echo "$DOTFILES_DIR"

# Bunch of symlinks
ln -sfv "$DOTFILES_DIR/runcom/.zshrc"
ln -sfv "$DOTFILES_DIR/runcom/.zshenv"
# ln -sfv "$DOTFILES_DIR/runcom/.vimrc"

# NEOVIM
mkdir -p ~/.config/nvim
ln -sfv $DOTFILES_DIR/config/nvim/init.lua ~/.config/nvim/init.lua
ln -sfv $DOTFILES_DIR/config/nvim/lua ~/.config/nvim/lua

# Alacritty
mkdir -p ~/.config/alacritty
cp $DOTFILES_DIR/config/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml

# Package managers & packages
. "$DOTFILES_DIR/install/brew.sh"
. "$DOTFILES_DIR/install/brew-cask.sh"
. "$DOTFILES_DIR/install/vscode.sh"

