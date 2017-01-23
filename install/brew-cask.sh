# Install Caskroom

brew tap caskroom/cask
brew install brew-cask
brew tap caskroom/versions

# Install packages

apps=(
  firefox
  google-chrome
  google-drive
  iterm2
  skype
  spotify
  sublime-text
  virtualbox
  vlc
  visual-studio-code
)

brew cask install "${apps[@]}"
