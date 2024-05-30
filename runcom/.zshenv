export PATH=$PATH:$HOME/.dotfiles/bin
export PATH=$PATH:$M2_HOME/bin
export PATH=$PATH:$HOME/.libs/flutter/bin
export PATH=$PATH:$HOME/.local/bin
export PATH="/usr/local/sbin:$PATH"

export BAT_THEME=ansi-light
export LANG="en_US.UTF-8"

# Ruby
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES # https://github.com/rails/rails/issues/38560

# KAFKA
# https://stackoverflow.com/questions/41964676/kafka-connect-running-out-of-heap-space
# export KAFKA_HEAP_OPTS="-Xms512m -Xmx1g"

eval "$(/usr/local/bin/brew shellenv)"

source ~/.otherenv
