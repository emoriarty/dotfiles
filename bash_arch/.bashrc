#
# ~/.bashrc
#

# Keychain integration
[ -f ~/.keychain/$(hostname)-sh ] && source ~/.keychain/$(hostname)-sh

eval "$(starship init bash)"
eval "$(mise activate bash)"
eval "$(direnv hook bash)"

# Bash autocompletions
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
  . /usr/share/bash-completion/bash_completion

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
