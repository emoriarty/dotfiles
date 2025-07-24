eval "$(keychain --eval --agents ssh id_ed25519)"

[[ -f ~/.bashrc ]] && . ~/.bashrc

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec Hyprland

