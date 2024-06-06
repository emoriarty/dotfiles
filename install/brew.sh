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
  tree
  wget
  zplug
  zsh-completions
)

brew install "${apps[@]}"
