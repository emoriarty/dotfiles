# Install Caskroom

brew tap caskroom/cask
brew tap caskroom/versions

# Install packages

apps=(
  firefox-developer-edition
  google-chrome
  iterm2
  visual-studio-code
)

brew cask install "${apps[@]}"
