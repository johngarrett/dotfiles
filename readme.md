# Dotfiles

Shared shell/editor configuration for macOS, Debian/Ubuntu, and Arch Linux, plus
a complete Hyprland desktop for the Arch workstation.

## Setup

```bash
git clone --recurse-submodules git@github.com:johngarrett/dotfiles.git
cd dotfiles
./setup.sh
```

The script asks before changing four subsystems:

1. Packages
2. Hyprland desktop configuration (Arch only)
3. BlexMono Nerd Font
4. User services

Press Enter to accept a prompt. Existing files and directories are moved to a
timestamped `.backup-YYYYMMDDHHMMSS` path before symlinks are created. Re-running
the script leaves correct symlinks alone.

Core Zsh, tmux, Alacritty, and Neovim links are installed on every supported
platform. On Arch, package installation uses a full `pacman -Syu` transaction to
avoid partial upgrades. Run `prefix-I` inside tmux afterward to install TPM
plugins.

On Linux, a login on tty1 automatically starts Hyprland. Other virtual
terminals and remote logins remain ordinary shell sessions.

## Hyprland desktop

The Arch setup is intentionally Wayland-native:

- **Hyprland** composes and tiles windows. Xwayland remains installed for apps
  that cannot run natively on Wayland.
- **Waybar** shows workspaces, audio, network, CPU, memory, temperature, time,
  tray items, idle state, and the session menu.
- **Fuzzel** provides the application, clipboard, and session menus.
- **Mako** handles notifications and starts on demand through D-Bus.
- **Cliphist** records text and image clipboard history from `wl-paste`.
- **Grim + Slurp** capture a selected region to both the clipboard and
  `~/Pictures/Screenshots`.
- **Hyprlock + Hypridle** lock and turn the display off after five idle
  minutes. Input wakes the display for unlocking. The desktop is never
  suspended automatically.
- **PipeWire + WirePlumber** provide audio; keybindings use `wpctl`.
- **xdg-desktop-portal-hyprland** provides screen sharing and desktop portals.
- **hyprpolkitagent** provides graphical authentication prompts.

Hyprpaper is deliberately not used: Hyprland renders a plain dark background.
Battery and brightness controls are omitted because this workstation has no
laptop battery or backlight device.

### Keybindings

| Binding | Action |
| --- | --- |
| `Super+Enter` | Open Alacritty |
| `Super+Space` | Open Fuzzel |
| `Super+Q` | Close the focused window |
| `Super+H/J/K/L` | Focus left/down/up/right |
| `Super+Shift+H/J/K/L` | Move the focused window |
| `Super+1…0` | Select workspace 1…10 |
| `Super+Shift+1…0` | Move a window to workspace 1…10 |
| `Super+F` | Toggle fullscreen |
| `Super+Shift+F` | Toggle floating |
| `Super+E` | Toggle the next dwindle split direction |
| `Super+W` | Create or toggle a tabbed window group |
| `Super+S` | Cycle the active window in a group |
| `Super+Shift+H/J/K/L` | Move a window; insert into or remove from a group when applicable |
| `Super+R` | Enter resize mode; use H/J/K/L and exit with Enter or Escape |
| `Super+Shift+S` | Select, save, and copy a screenshot |
| `Super+Alt+Space` | Select an item from clipboard history |
| `Super+L` | Lock the session |
| `Super+Shift+C` | Reload Hyprland |
| `Super+Shift+E` | Open the confirmed session/power menu |
| `Super+mouse left/right` | Move/resize a window |

Media keys control PipeWire volume, microphone mute, and Playerctl-compatible
players. Caps Lock and Escape are swapped, as are Alt and Super. Focus does not
follow the mouse, matching the previous i3 setup.

### Display assumptions

`HDMI-A-2` is configured for the Apple Studio Display at 3840×2160, 60 Hz, and
1.5 scale. A preferred-mode/automatic-scale fallback handles other outputs. The
workspace setup is single-display and uses workspaces 1 through 10. Waybar uses
regular numbers and only renders workspaces that currently exist.

### User services

Long-running session components are ordinary systemd user services:

```bash
systemctl --user status waybar hypridle hyprpolkitagent
systemctl --user status cliphist-text cliphist-image ssh-agent
```

Service logs are available with `journalctl --user -u NAME`. The shared Zsh
configuration points `SSH_AUTH_SOCK` at the managed agent only on Linux. Nodenv
initialization remains shared between Linux and macOS and runs only when nodenv
is installed.

## Configuration locations

- Hyprland, lock, and idle: `hypr/`
- Waybar: `waybar/`
- Fuzzel: `fuzzel/`
- Mako: `mako/`
- Screenshot, clipboard, and session helpers: `bin/`
- User services: `systemd/user/`
- Maintainer and agent notes: `docs/`

Neovim is a submodule from the personal NvChad repository. Setup refreshes it
from that repository's `jgarrett/nvchad-config` default branch.

## Rollback

Stop or disable an unwanted service with:

```bash
systemctl --user disable --now SERVICE
```

To restore a replaced config, remove its symlink and rename the corresponding
timestamped backup to its original name. Package removal is intentionally
limited to Hyprpaper, which this configuration replaces with Hyprland's plain
background; Xwayland is retained because Hyprland requires it.
