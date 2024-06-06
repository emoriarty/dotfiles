# Install Caskroom

brew tap homebrew/cask
brew tap homebrew/cask-versions

# Install packages

apps=(
  alacritty
  docker
  firefox
  google-chrome
  visual-studio-code
)

brew install --cask "${apps[@]}"
