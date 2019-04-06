# Install Caskroom

brew tap caskroom/cask
brew install brew-cask
brew tap caskroom/versions

# Install packages

apps=(
  firefox-developer-edition
  google-chrome
  google-drive
  iterm2
  visual-studio-code
)

brew cask install "${apps[@]}"
