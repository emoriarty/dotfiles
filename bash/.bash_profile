# Replace CAPS LOCK by CTRL
if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
  gsettings set org.gnome.desktop.input-sources xkb-options "['ctrl:nocaps']"
elif [ "$XDG_SESSION_TYPE" = "x11" ]; then
  setxkbmap -option ctrl:nocaps
fi

# Load .bashrc
if [ -n "$BASH_VERSION" ] && [ -f "$HOME/.bashrc" ]; then
  . "$HOME/.bashrc"
fi
