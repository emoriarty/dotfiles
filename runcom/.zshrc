if [ "$TMUX" = "" ]; then exec tmux; fi

export ZPLUG_HOME=/usr/local/opt/zplug
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
zplug "zsh-users/zsh-syntax-highlighting", from:github,  defer:2
zplug load --verbose

# Actually install plugins, prompt user input
if ! zplug check --verbose; then
  printf "Install zplug plugins? [y/N]: "
  if read -q; then
      echo; zplug install
  fi
fi

eval "$(nodenv init -)"
eval "$(rbenv init -)"
eval "$(direnv hook zsh)"
if which jenv > /dev/null; then eval "$(jenv init -)"; fi

alias ctags="`brew --prefix`/bin/ctags"
alias vi=vim
alias cls=clear
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

# Functions
function aliases() {
  alias | grep -i $1 | sort -R | less
}
