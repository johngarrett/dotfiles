# Keep the SSH agent available to every login shell. The user service started
# by setup.sh owns this socket and keeps the key loaded for the session.
if [[ "$(uname -s)" == Linux ]]; then
  export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR:-/run/user/$UID}/ssh-agent.socket"
  if [[ -f "$HOME/.ssh/id_ed25519" ]] && ssh-add -l >/dev/null 2>&1; then
    :
  elif [[ -f "$HOME/.ssh/id_ed25519" ]]; then
    ssh-add "$HOME/.ssh/id_ed25519"
  fi
fi

# Start the graphical session after an interactive login on the first virtual
# terminal. SSH sessions and additional local terminals remain shells.
if [[ "$(uname -s)" == Linux && -z "${WAYLAND_DISPLAY:-}" && "${XDG_VTNR:-0}" == 1 ]] && command -v start-hyprland >/dev/null 2>&1; then
  exec start-hyprland
fi
