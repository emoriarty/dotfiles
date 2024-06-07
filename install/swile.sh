apps=(
  postgresql
  libpq
  redis
  awscli
  session-manager-plugin
  coreutils
  jq
  sshuttle
  kubectl
)

brew install "${apps[@]}"

cask_apps=(
  1password
)

brew install --cask "${cask_apps[@]}"

# Get current dir (so run this script from anywhere)

export SWILE_DIR
SWILE_DIR="$( cd "$( dirname "${(%):-%N}" )" && pwd )"/install/swile

# Tmuxifier layouts
mkdir -p ~/.tmuxifier/layouts
ln -sfv $SWILE_DIR/tmuxifier/benefits-mv.session.sh ~/.tmuxifier/layouts/
ln -sfv $SWILE_DIR/tmuxifier/kube-benefits-production.session.sh ~/.tmuxifier/layouts/
ln -sfv $SWILE_DIR/tmuxifier/kube-benefits-staging.session.sh ~/.tmuxifier/layouts/