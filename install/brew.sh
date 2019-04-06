# Install Homebrew

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap homebrew/versions
brew tap homebrew/dupes
brew tap Goles/battery
brew update
brew upgrade

# Install packages

apps=(
  git
  git-extras
  grep --with-default-names
  nodenv
  nvim
  reattach-to-user-namespace
  tmux
  tree
  wget
)

brew install "${apps[@]}"
