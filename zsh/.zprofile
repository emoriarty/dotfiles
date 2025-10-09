export PATH=/opt/bin:$PATH
export PATH=/opt/homebrew/bin:$PATH
export PATH=$HOME/.tmuxifier/bin:$PATH

if command -v tmuxifier &> /dev/null; then
  eval "$(tmuxifier init -)"
fi
