# Install Caskroom

brew tap homebrew/cask
brew tap homebrew/cask-versions

# Install packages

apps=(
  docker
  firefox
  google-chrome
  kubernetes-cli
  joplin
  visual-studio-code
)

brew cask install "${apps[@]}"
