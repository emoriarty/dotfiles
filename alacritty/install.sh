#!/usr/bin/env bash
# Alacritty auto-theme installation script
# Installs the theme switcher service and enables automatic theme switching
# This script is idempotent - safe to run multiple times

set -e

#################
# INSTALL THEMES
#################
ALACRITTY_PATH=~/.config/alacritty
ALACRITTY_THEMES_PATH=${ALACRITTY_PATH}/themes

if [ ! -d $ALACRITTY_THEMES_PATH ]; then
  # Download themes
  mkdir -p $ALACRITTY_THEMES_PATH
  git clone https://github.com/alacritty/alacritty-theme $ALACRITTY_THEMES_PATH
else
  # Update themes
  git -C $ALACRITTY_THEMES_PATH pull
fi

# Verify .gitignore exists
if [ ! -f $ALACRITTY_PATH/.gitignore ]; then
  touch $ALACRITTY_PATH/.gitignore
fi

# Look for themes folder in file
if ! grep -Fxq "themes/" $ALACRITTY_PATH/.gitignore; then
  echo "themes/" >> $ALACRITTY_PATH/.gitignore
fi

########################
# AUTOMATE THEME SWITCH
########################
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SYSTEMD_USER_DIR="$HOME/.config/systemd/user"
SERVICE_FILE="alacritty-theme-monitor.service"

echo "Installing Alacritty auto-theme switcher..."

# Create systemd user directory if it doesn't exist
if [[ ! -d "$SYSTEMD_USER_DIR" ]]; then
    echo "Creating systemd user directory: $SYSTEMD_USER_DIR"
    mkdir -p "$SYSTEMD_USER_DIR"
fi

# Copy service file
echo "Installing service file..."
cp "$SCRIPT_DIR/$SERVICE_FILE" "$SYSTEMD_USER_DIR/$SERVICE_FILE"

# Make switch-theme.sh executable
echo "Making switch-theme.sh executable..."
chmod +x "$HOME/.config/alacritty/switch-theme.sh"

# Reload systemd
echo "Reloading systemd daemon..."
systemctl --user daemon-reload

# Enable service if not already enabled
if systemctl --user is-enabled --quiet "$SERVICE_FILE" 2>/dev/null; then
    echo "Service already enabled"
else
    echo "Enabling service..."
    systemctl --user enable "$SERVICE_FILE"
fi

# Restart service (works whether it's running or not)
echo "Starting/restarting service..."
systemctl --user restart "$SERVICE_FILE"

# Check service status
if systemctl --user is-active --quiet "$SERVICE_FILE"; then
    echo "✓ Service installed and running successfully!"
    echo "Run 'systemctl --user status $SERVICE_FILE' to check status"
else
    echo "✗ Service installation failed. Check logs with:"
    echo "  journalctl --user -u $SERVICE_FILE -n 20"
    exit 1
fi
