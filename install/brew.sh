# Install Homebrew

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew tap Goles/battery
brew update
brew upgrade

# Install packages

apps=(
  bat
  direnv
  git
  git-extras
#  goenv
  grep
  kubernetes-cli
  neovim
  reattach-to-user-namespace
  rbenv
  ruby-build
  tmux
  tree
  watch
  wget
  zellij
  zplug
  zsh-completions
)

brew install "${apps[@]}"

# Install Caskroom

brew tap homebrew/cask
brew tap homebrew/cask-versions

apps=(
  alacritty
  docker
  firefox
  google-chrome
  visual-studio-code
)

brew install --cask "${apps[@]}"
