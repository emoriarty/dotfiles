# Install Caskroom

brew tap homebrew/cask
brew tap homebrew/cask-versions

# Install packages

apps=(
  firefox
  google-chrome
  joplin
  visual-studio-code
)

brew cask install "${apps[@]}"
