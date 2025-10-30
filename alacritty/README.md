# Alacritty Configuration

Alacritty terminal emulator configuration with automatic theme switching based on system preferences.

## Features

- **Automatic theme switching**: Changes between light and dark themes based on your system's color scheme
- **Minimal configuration**: Simple TOML-based config
- **Systemd service**: Monitors system theme changes in real-time

## Files

- `alacritty.toml` - Main Alacritty configuration
- `switch-theme.sh` - Script that detects system theme and updates config
- `alacritty-theme-monitor.service` - Systemd service for automatic theme monitoring
- `install.sh` - Installation script for the auto-theme service

## Installation

### 1. Link configuration files

Use GNU Stow or symlink the config directory:

```bash
cd ~/dotfiles
stow alacritty
```

Or manually:

```bash
ln -s ~/dotfiles/alacritty/.config/alacritty ~/.config/alacritty
```

### 2. Install auto-theme service

```bash
cd ~/dotfiles/alacritty
./install.sh
```

This will:
- Download/update Alacritty themes from [alacritty/alacritty-theme](https://github.com/alacritty/alacritty-theme) repository
- Install the systemd user service
- Enable automatic theme switching
- Start the service immediately

The install script is idempotent - you can run it multiple times safely.

### 3. Verify installation

Check that the service is running:

```bash
systemctl --user status alacritty-theme-monitor.service
```

## Configuration

### Themes

The installation script automatically downloads 200+ themes from the [alacritty/alacritty-theme](https://github.com/alacritty/alacritty-theme) repository to `~/.config/alacritty/themes/`. This directory is managed by git and can be updated by re-running `./install.sh`.

### Changing themes

Edit `switch-theme.sh` to customize which themes are used:

```bash
LIGHT_THEME="ashes_light.toml"  # Change to your preferred light theme
DARK_THEME="autumn.toml"        # Change to your preferred dark theme
```

Browse available themes in `~/.config/alacritty/themes/themes/` or at https://github.com/alacritty/alacritty-theme

### Manual theme switch

Run the script manually to switch themes immediately:

```bash
~/.config/alacritty/switch-theme.sh
```

## Troubleshooting

### Service not switching themes

Check service logs:

```bash
journalctl --user -u alacritty-theme-monitor.service -f
```

### Restart the service

```bash
systemctl --user restart alacritty-theme-monitor.service
```

### Stop the service

```bash
systemctl --user stop alacritty-theme-monitor.service
systemctl --user disable alacritty-theme-monitor.service
```

## Requirements

- Alacritty terminal emulator
- GNOME/GTK-based desktop environment (uses `gsettings`)
- systemd (for automatic theme monitoring)
