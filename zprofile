# Start the graphical session after an interactive login on the first virtual
# terminal. SSH sessions and additional local terminals remain shells.
if [[ "$(uname -s)" == Linux && -z "${WAYLAND_DISPLAY:-}" && "${XDG_VTNR:-0}" == 1 ]] && command -v start-hyprland >/dev/null 2>&1; then
  exec start-hyprland
fi
