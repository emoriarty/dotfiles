export PATH="$HOME/.ndenv/bin:$PATH"

source ~/.dotfiles/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle tmux
antigen bundle npm
antigen bundle git
antigen bundle command-not-found
antigen bundle Tarrasch/zsh-autoenv

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme robbyrussell
# antigen theme agnoster

# Tell antigen that you're done.
antigen apply

git clone https://github.com/zsh-users/antigen.git

eval "$(ndenv init -)"

alias ctags="`brew --prefix`/bin/ctags"
