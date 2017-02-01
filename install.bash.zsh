#!/usr/bin/env bash

# Get current dir (so run this script from anywhere)

export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "$DOTFILES_DIR"

# Bunch of symlinks
# (by default zsh prevails before bash)
ln -sfv "$DOTFILES_DIR/runcom/.zshrc" ~
ln -sfv "$DOTFILES_DIR/runcom/.tmux.conf" ~
ln -sfv "$DOTFILES_DIR/runcom/.ctags" ~
ln -sfv "$DOTFILES_DIR/runcom/.vimrc" ~
ln -sfv "$DOTFILES_DIR/runcom/.vimrc.bundle" ~
ln -sfv "$DOTFILES_DIR/runcom/.vim" ~

# Package managers & packages
. "$DOTFILES_DIR/install/brew.sh"
if [ "$(uname)" == "Darwin" ]; then
  . "$DOTFILES_DIR/install/brew-cask.sh"
fi

# Configuring vim
if [ ! -e "$HOME"/.vim/autoload/plug.vim ]; then
  curl -fLo "$HOME"/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

vim -u "$HOME"/.vimrc.bundle +PlugInstall +PlugClean! +qa -

# Setting zsh
. "$DOTFILES_DIR/install/bash.sh"


