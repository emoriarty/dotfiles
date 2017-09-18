# Install Homebrew

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap homebrew/versions
brew tap homebrew/dupes
brew tap Goles/battery
brew update
brew upgrade

# Install packages

apps=(
  ack
  antigen
  doxygen
  git
  git-extras
  grep --with-default-names
  macvim
  rbenv
  reattach-to-user-namespace
  ruby-build
  the_silver_searcher
  tmux
  tree
  vim
  wget
)

brew install "${apps[@]}"
