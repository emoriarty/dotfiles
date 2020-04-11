# Install Homebrew

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew tap Goles/battery
brew update
brew upgrade

# Install packages

apps=(
  git
  git-extras
  grep
  nodenv
  rbenv
  reattach-to-user-namespace
  tmux
  tree
  vim
  wget
  zsh-completions
)

brew install "${apps[@]}"
