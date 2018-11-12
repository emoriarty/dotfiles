#!/usr/bin/env bash

# Get current dir (so run this script from anywhere)

export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "$DOTFILES_DIR"

# Bunch of symlinks
# (by default zsh prevails before bash)
ln -sfv "$DOTFILES_DIR/runcom/zshrc" ~/.zshrc
ln -sfv "$DOTFILES_DIR/runcom/tmux.conf" ~/.tmux.conf
ln -sfv "$DOTFILES_DIR/runcom/ctags" ~/.ctags
ln -sfv "$DOTFILES_DIR/runcom/vimrc" ~/.vimrc
ln -sfv "$DOTFILES_DIR/runcom/init.vm" ~/.config/nvim/init.vim

# Package managers & packages
. "$DOTFILES_DIR/install/brew.sh"
if [ "$(uname)" == "Darwin" ]; then
  . "$DOTFILES_DIR/install/brew-cask.sh"
fi

# Setting zsh
. "$DOTFILES_DIR/install/zsh.sh"
