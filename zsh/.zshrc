# if [ "$TMUX" = "" ]; then exec tmux; fi

export PATH=$PATH:/opt/homebrew/bin

export ZPLUG_HOME=/opt/homebrew/opt/zplug
source $ZPLUG_HOME/init.zsh

# https://github.com/robbyrussell/oh-my-zsh/tree/master/lib
#zplug "lib/clipboard", from:oh-my-zsh
#zplug "lib/completion", from:oh-my-zsh
zplug "lib/directories", from:oh-my-zsh
#zplug "lib/functions", from:oh-my-zsh
zplug "lib/git", from:oh-my-zsh
#zplug "lib/grep", from:oh-my-zsh
#zplug "lib/history", from:oh-my-zsh
#zplug "lib/termsupport", from:oh-my-zsh
# https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins
#zplug "plugins/tmux", from:oh-my-zsh
#zplug "plugins/npm", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
#zplug "plugins/command-not-found", from:oh-my-zsh
#zplug "Tarrasch/zsh-autoenv", from:github
#zplug "mafredri/zsh-async", from:github
#zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
#zplug "zsh-users/zsh-syntax-highlighting", from:github,  defer:2
#zplug "plugins/git-prompt", from:oh-my-zsh
zplug load #--verbose

# Actually install plugins, prompt user input
if ! zplug check --verbose; then
  printf "Install zplug plugins? [y/N]: "
  if read -q; then
      echo; zplug install
  fi
fi

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

#if which nodenv > /dev/null; then  eval "$(nodenv init -)"; fi
if which rbenv > /dev/null; then  eval "$(rbenv init -)"; fi
if which pyenv > /dev/null; then  eval "$(pyenv init -)"; fi
#if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
if which direnv > /dev/null; then  eval "$(direnv hook zsh)"; fi
#if which goenv > /dev/null; then  eval "$(goenv init -)"; fi
if which jenv > /dev/null; then
  eval "$(jenv init -)"
  jenv enable-plugin export
fi

#alias ctags="`brew --prefix`/bin/ctags"
#alias vi=nvim
alias cls=clear
alias newer="ls -dt \!* | head -1"
alias be="bundle exec"
alias kamal='docker run -it --rm -v "${PWD}:/workdir" -v "/run/host-services/ssh-auth.sock:/run/host-services/ssh-auth.sock" -e SSH_AUTH_SOCK="/run/host-services/ssh-auth.sock" -v /var/run/docker.sock:/var/run/docker.sock ghcr.io/basecamp/kamal:latest'

# Functions
function prettygrep() {
  grep -nr $1 $2 | awk -F: '{print $2" - Line number : "$1}'
}

function aliases() {
  alias | grep -i $1 | sort -R | less
}

# How much time to wait for additional characters in sequence
KEYTIMEOUT=1

# added by travis gem
[ -f /Users/enric/.travis/travis.sh ] && source /Users/enric/.travis/travis.sh

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

#function show_virtual_env() {
#  if [[ -n "$VIRTUAL_ENV" && -n "$DIRENV_DIR" ]]; then
#    echo "($(basename $VIRTUAL_ENV)) "
#  else
#    echo ""
#  fi
#}
#PS1='$(show_virtual_env)'$PS1

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


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
export PATH="/usr/local/opt/postgresql@16/bin:$PATH"

eval "$(starship init zsh)"
