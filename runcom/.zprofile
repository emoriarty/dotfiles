export PATH=/opt/bin:$PATH
export PATH=/opt/homebrew/bin:$PATH
export PATH=/opt/homebrew/opt/mysql-client/bin:$PATH
export PATH=$HOME/.tmuxifier/bin:$PATH

# Postgres 15
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"

eval "$(tmuxifier init -)"
