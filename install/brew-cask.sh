# Install Caskroom

brew tap caskroom/cask
brew tap caskroom/versions

# Install packages

apps=(
  firefox
  google-chrome
  visual-studio-code
)

brew cask install "${apps[@]}"
