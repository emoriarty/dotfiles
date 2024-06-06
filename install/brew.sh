# Install Homebrew

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
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
  jenv
  kubernetes-cli
  neovim
  nodenv
#  pyenv
#  pyenv-virtualenv
  reattach-to-user-namespace
  rbenv
  ruby-build
  tree
  neovim
  wget
  zplug
  zsh-completions
)

brew install "${apps[@]}"
