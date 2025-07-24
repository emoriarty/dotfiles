# Start keychain and export variables
eval "$(keychain --eval --agents ssh id_ed25519)"

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Start Hyprland with env file
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && source "$HOME/.keychain/$(hostname)-sh" && exec Hyprland
