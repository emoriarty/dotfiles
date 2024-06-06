#!/usr/bin/env zsh

# Get current dir (so run this script from anywhere)

export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${(%):-%N}" )" && pwd )"

printf "Setting up your Mac...\n"
printf "This will take a while, please be patient.\n\n"

echo "$DOTFILES_DIR"

# Bunch of symlinks
ln -sfv $DOTFILES_DIR/runcom/.zshrc ~/.zshrc
ln -sfv $DOTFILES_DIR/runcom/.zprofile ~/.zprofile
ln -sfv $DOTFILES_DIR/runcom/.zshenv ~/.zshenv

source ~/.zprofile

# NEOVIM
mkdir -p ~/.config/nvim
ln -sfv $DOTFILES_DIR/config/nvim/init.lua ~/.config/nvim/init.lua
ln -sfv $DOTFILES_DIR/config/nvim/lua ~/.config/nvim/lua

# ALACRITTY
mkdir -p ~/.config/alacritty
mkdir -p ~/.config/alacritty/themes
mkdir -p ~/.config/alacritty/fonts
cp $DOTFILES_DIR/config/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml
cp $DOTFILES_DIR/config/alacritty/font.toml ~/.config/alacritty/font.toml
cp $DOTFILES_DIR/config/alacritty/theme.toml ~/.config/alacritty/theme.toml
cp $DOTFILES_DIR/config/alacritty/themes/*.toml ~/.config/alacritty/themes/
cp $DOTFILES_DIR/config/alacritty/fonts/*.toml ~/.config/alacritty/fonts/

# INSTALL SCRIPTS
. "$DOTFILES_DIR/install/brew.sh"
. "$DOTFILES_DIR/install/fonts.sh"
. "$DOTFILES_DIR/install/brew-cask.sh"
. "$DOTFILES_DIR/install/vscode.sh"

