#!/usr/bin/env bash
# Alacritty theme switcher based on system preferences
# Minimal script to switch between light and dark themes

# Configuration
CONFIG_FILE="$HOME/.config/alacritty/alacritty.toml"
THEMES_DIR="$HOME/.config/alacritty/themes/themes"
LIGHT_THEME="ashes_light.toml"
DARK_THEME="autumn.toml"

# Detect system theme preference
get_system_theme() {
    # Check using gsettings (GNOME/GTK-based systems)
    if command -v gsettings &> /dev/null; then
        theme=$(gsettings get org.gnome.desktop.interface color-scheme 2>/dev/null)
        if [[ "$theme" == *"dark"* ]]; then
            echo "dark"
            return
        fi
    fi

    # Fallback to default theme (usually light)
    echo "default"
}

# Switch theme in config file
switch_theme() {
    local theme_file="$1"
    local theme_path="$THEMES_DIR/$theme_file"

    if [[ ! -f "$theme_path" ]]; then
        echo "Error: Theme file not found: $theme_path" >&2
        exit 1
    fi

    # Replace the import block (handles both single-line and multi-line formats)
    sed -i '/^import = \[/,/^\]/c\import = [\n  "'"$theme_path"'"\n]' "$CONFIG_FILE"
    echo "Switched to $theme_file"
}

# Main logic
main() {
    system_theme=$(get_system_theme)

    if [[ "$system_theme" == "dark" ]]; then
        switch_theme "$DARK_THEME"
    else
        switch_theme "$LIGHT_THEME"
    fi
}

main "$@"
