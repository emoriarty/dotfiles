# if [ "$TMUX" = "" ]; then exec tmux; fi

export PATH=$PATH:/opt/homebrew/bin

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

#alias ctags="`brew --prefix`/bin/ctags"
alias cls=clear
alias newer="ls -dt \!* | head -1"
alias be="bundle exec"
alias g=lazygit
alias d=lazydocker
alias n=nvim

# Functions
function prettygrep() {
  grep -nr $1 $2 | awk -F: '{print $2" - Line number : "$1}'
}

function aliases() {
  alias | grep -i $1 | sort -R | less
}

# How much time to wait for additional characters in sequence
KEYTIMEOUT=1

# path navigation whitout cd
setopt autocd autopushd pushdignoredups
# history navigation: https://unix.stackexchange.com/a/97844
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end

#eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib=$HOME/perl5)"

# Prompt
setopt PROMPT_SUBST

function removecontainers() {
    docker stop $(docker ps -aq)
    docker rm $(docker ps -aq)
}

function armageddon() {
    removecontainers
    docker network prune -f
    docker rmi -f $(docker images --filter dangling=true -qa)
    docker volume rm $(docker volume ls --filter dangling=true -q)
    docker rmi -f $(docker images -qa)
}

if command -v starship &> /dev/null; then
  eval "$(starship init zsh)"
fi

if command -v mise &> /dev/null; then
  eval "$(mise activate zsh)"
fi

if command -v direnv &> /dev/null; then
  eval "$(direnv hook zsh)"
fi

[[ -f "$HOME/.heloa.sh" ]] && . $HOME/.heloa.sh
