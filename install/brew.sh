# Install Homebrew

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap homebrew/versions
brew tap homebrew/dupes
brew tap Goles/battery
brew update
brew upgrade

# Install packages

apps=(
  antigen
  git
  git-extras
  grep --with-default-names
  macvim
  tree
  vim
  wget
)

brew install "${apps[@]}"
