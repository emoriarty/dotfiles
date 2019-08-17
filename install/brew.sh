# Install Homebrew

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap Goles/battery
brew update
brew upgrade

# Install packages

apps=(
  git
  git-extras
  grep
  nodenv
  nvim
  rbenv
  reattach-to-user-namespace
  tmux
  tree
  vim
  wget
  zplug
)

brew install "${apps[@]}"
