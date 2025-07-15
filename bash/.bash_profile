# Replace CAPS LOCK by CTRL
if [ "$SESSION_TYPE" = "wayland" ]; then
  echo "Usando Wayland → configurando con gsettings..."
  gsettings set org.gnome.desktop.input-sources xkb-options "['ctrl:nocaps']"
elif [ "$SESSION_TYPE" = "x11" ]; then
  echo "Usando X11 → configurando con setxkbmap..."
  setxkbmap -option ctrl:nocaps
fi

# Load .bashrc
if [ -n "$BASH_VERSION" ] && [ -f "$HOME/.bashrc" ]; then
  . "$HOME/.bashrc"
fi
