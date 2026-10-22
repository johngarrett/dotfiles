# Hyprland setup notes for maintainers and agents

This file records the intent behind the Arch desktop configuration. Read it
before changing the setup script or replacing a desktop component.

## Supported environment

- Arch Linux with Hyprland 0.56 or newer using the Lua config provider.
- One Apple Studio Display on `HDMI-A-2`, 3840×2160 at 60 Hz, scale 1.5.
- A generic preferred-mode monitor rule remains for other or renamed outputs.
- NVIDIA GTX 1070 uses repository-managed suspend/resume settings so its video
  memory is preserved across deep suspend.
- The Gigabyte Z170 firmware can flood ACPI GPE 0x69 when the Studio Display
  is attached. Do not mask that GPE: it is also involved in the display's
  Thunderbolt/USB hot-plug path.
- Xwayland is intentional: the installed Hyprland package requires it and some
  applications still need X11 compatibility. The retired i3/X11 desktop stack
  must not be reintroduced.

## Intentional component choices

| Need | Component | Lifecycle |
| --- | --- | --- |
| Compositor | Hyprland Lua config | Hyprland session |
| Bar | Waybar | `waybar.service` |
| Launcher/menus | Fuzzel | On demand |
| Notifications | Mako | D-Bus activation |
| Clipboard history | Cliphist + wl-clipboard | Two user services |
| Screenshots | Grim + Slurp | On demand helper |
| Lock and idle | Hyprlock + Hypridle | Packaged user service |
| Authentication | hyprpolkitagent | Packaged user service |
| Audio | PipeWire + WirePlumber | User services/sockets |
| Screen sharing | xdg-desktop-portal-hyprland | D-Bus activation |

Desktop setup sets Firefox as the default browser and handler for HTTP, HTTPS,
and HTML files, so external web links open in Firefox. The Arch package step
installs `firefox` and `xdg-utils` for this configuration.

There is a Hyprpaper wallpaper service, but no battery module, backlight binding, Rofi, Dunst,
Picom, Polybar, or external gesture daemon. The machine has no laptop battery,
backlight, touchpad, or second display. Waybar shows ordinary numeric buttons
only for workspaces that currently exist.

The workspace buttons use Waybar's `ext/workspaces` module with the `activate`
click action. This uses the Wayland workspace protocol and avoids Waybar 0.15's
`hyprland/workspaces` module sending legacy dispatch commands that the Hyprland
Lua dispatcher no longer accepts.

Hypridle has two ordered five-minute listeners: the first locks the session and
the second powers the display off. The DPMS listener turns the display back on
as soon as input resumes. System resume uses `restore-display`, which waits for
the Wayland output to reappear before re-enabling DPMS. Do not separate these
timeouts unless lock and screen power policy are intentionally being changed
together.

The temperature module reads the i7-6700K package sensor at
`/sys/devices/platform/coretemp.0/hwmon/*/temp1_input`. The driver reports an
80°C high threshold and 100°C critical limit, so Waybar uses green below 60°C,
amber at 60–79°C, and red at 80°C or above. Re-check the hwmon thresholds before
copying these colors to different CPU hardware.

## Binding principles

Super is the main modifier. Vim-direction focus/movement, numbered workspaces,
fullscreen, floating, launcher, screenshot, reload, and resize behavior were
carried over from i3. Hyprland groups replace i3's tabbed/stacked concept:
`Super+W` creates or toggles the active window's group, while `Super+S` cycles
the active group. `Super+Shift+H/J/K/L` moves a window directionally and is
group-aware: moving toward a group adds a tab, while moving a tab away removes
it. The scrolling layout normally inserts new windows in columns to the right.
`Super+V` arms a one-shot vertical split in the focused column: the next tiled
window opens beneath it. `Super+B` cancels the pending split, restoring normal
horizontal placement. `Super+E` resizes all columns to fit the viewport.
`Super+mouse wheel` focuses adjacent columns without
wrapping at either end. The focused window has a 1px white border.
There is no replacement for i3 parent-container focus or arbitrary nested splits.

Hyprland 0.56's `hyprctl dispatch` evaluates Lua. Shell helpers and bindings
must therefore use expressions such as:

```bash
hyprctl dispatch 'hl.dsp.submap("resize")'
hyprctl dispatch 'hl.dsp.submap("")'
hyprctl dispatch 'hl.dsp.exit()'
```

Inside `hyprland.lua`, prefer native dispatcher objects such as
`hl.dsp.group.toggle()` and `hl.dsp.group.next()` over spawning `hyprctl`.

Legacy strings such as `hyprctl dispatch submap resize` do not work on this
version even though they are common in older Hyprland examples.

## Setup behavior

`setup.sh` is interactive and defaults each subsystem prompt to Yes. It always
backs up a conflicting path with a shared timestamp before linking. Core
dotfiles are cross-platform; the Hyprland portion only runs on pacman-based
Linux. Nodenv is shared between macOS and Linux. Only the systemd SSH-agent
socket export is Linux-specific.

The Neovim submodule follows the remote default branch named
`jgarrett/nvchad-config`. The old pinned commit was deleted upstream, so setup
uses `git submodule update --init --remote --recursive` and warns rather than
blocking every other dotfile if the submodule is temporarily unavailable.

Package installation intentionally uses `pacman -Syu --needed`, never `-Sy`, to
avoid an unsupported partial Arch upgrade. Hyprpaper is installed and managed
as a user service because it provides the selected background.

## Validation checklist

```bash
bash -n setup.sh bin/*
zsh -n zshrc
fuzzel --check-config --config=fuzzel/fuzzel.ini
systemd-analyze --user verify systemd/user/*.service
Hyprland --verify-config --config "$PWD/hypr/hyprland.lua"
hyprctl reload
hyprctl configerrors
systemctl --user --failed
systemctl --user status waybar hypridle hyprpolkitagent
systemctl --user status cliphist-text cliphist-image ssh-agent
```

Waybar, Mako, and Hypridle should also receive a short live-session smoke test
after format or module changes. Do not automate Hyprlock, power-menu actions, or
screenshots during validation because they lock, terminate, or alter the user's
session and clipboard.

## Current installation and rollback

The first installation backed up the original generated Hyprland config,
Linux Zsh config, and SSH agent unit with timestamp `20260913183556`. Do not
delete those backups automatically. To roll back a path, disable its related
service, remove the symlink, and rename the timestamped backup to its original
name.

The package prompt could not run inside the agent session because local sudo
requires the user's password. Until the user runs that phase in a terminal,
Pavucontrol may be absent and Hyprpaper may remain installed; neither prevents
the rest of the desktop from running.
