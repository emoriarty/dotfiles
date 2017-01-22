#!/usr/bin/env bash

# Get current dir (so run this script from anywhere)

export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "$DOTFILES_DIR"

# Bunch of symlinks
# (by default zsh prevails before bash)
# ln -sfv "$DOTFILES_DIR/runcom/.bash_profile" ~
# ln -sfv "$DOTFILES_DIR/runcom/.inputrc" ~
# ln -sfv "$DOTFILES_DIR/runcom/.gemrc" ~
ln -sfv "$DOTFILES_DIR/runcom/.zshrc" ~

# Package managers & packages
. "$DOTFILES_DIR/install/brew.sh"
# . "$DOTFILES_DIR/install/bash.sh"
. "$DOTFILES_DIR/install/zsh.sh"

if [ "$(uname)" == "Darwin" ]; then
  . "$DOTFILES_DIR/install/brew-cask.sh"
fi
