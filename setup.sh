#!/usr/bin/env bash
set -Eeuo pipefail

REPO_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}"
DATA_DIR="${XDG_DATA_HOME:-$HOME/.local/share}"
STAMP="$(date +%Y%m%d%H%M%S)"

log() { printf '[setup] %s\n' "$*"; }
die() { printf '[setup] error: %s\n' "$*" >&2; exit 1; }

confirm() {
  local prompt="$1" reply
  [[ -r /dev/tty ]] || die "interactive terminal required"
  read -r -p "[setup] ${prompt} [Y/n] " reply </dev/tty
  [[ -z "$reply" || "$reply" =~ ^[Yy]$ ]]
}

backup_target() {
  local target="$1"
  if [[ -e "$target" || -L "$target" ]]; then
    local backup="${target}.backup-${STAMP}"
    mv -- "$target" "$backup"
    log "backed up $target to $backup"
  fi
}

link_config() {
  local source="$1" target="$2"
  mkdir -p "$(dirname -- "$target")"
  if [[ "$(readlink "$target" 2>/dev/null || true)" != "$source" ]]; then
    backup_target "$target"
    ln -s -- "$source" "$target"
    log "linked $target"
  fi
}

install_packages() {
  case "$(uname -s)" in
    Darwin)
      command -v brew >/dev/null 2>&1 || die "Homebrew is required on macOS: https://brew.sh"
      brew install git curl zsh tmux neovim
      brew install --cask alacritty || true
      ;;
    Linux)
      if command -v apt-get >/dev/null 2>&1; then
        sudo apt-get update
        sudo apt-get install -y git curl zsh tmux neovim alacritty
      elif command -v pacman >/dev/null 2>&1; then
        sudo pacman -Syu --needed --noconfirm \
          git curl zsh tmux neovim alacritty \
          hyprland waybar fuzzel mako cliphist grim slurp wl-clipboard \
          hyprlock hypridle hyprpolkitagent \
          xdg-desktop-portal xdg-desktop-portal-hyprland xdg-desktop-portal-gtk \
          pipewire pipewire-pulse wireplumber playerctl pavucontrol \
          noto-fonts noto-fonts-emoji xorg-xwayland

        if pacman -Q hyprpaper >/dev/null 2>&1; then
          sudo pacman -Rns --noconfirm hyprpaper
          log "removed unused hyprpaper package"
        fi
      else
        die "unsupported Linux distribution: install git, curl, zsh, tmux, neovim, and alacritty manually"
      fi
      ;;
    *) die "only macOS and Linux are supported" ;;
  esac
}

install_core_configs() {
  link_config "$REPO_DIR/zshrc" "$HOME/.zshrc"
  link_config "$REPO_DIR/zprofile" "$HOME/.zprofile"
  link_config "$REPO_DIR/tmux.conf" "$HOME/.tmux.conf"
  link_config "$REPO_DIR/alacritty.toml" "$CONFIG_DIR/alacritty/alacritty.toml"
  link_config "$REPO_DIR/nvim" "$CONFIG_DIR/nvim"
}

install_hyprland_configs() {
  link_config "$REPO_DIR/hypr/hyprland.lua" "$CONFIG_DIR/hypr/hyprland.lua"
  link_config "$REPO_DIR/hypr/hyprlock.conf" "$CONFIG_DIR/hypr/hyprlock.conf"
  link_config "$REPO_DIR/hypr/hypridle.conf" "$CONFIG_DIR/hypr/hypridle.conf"
  link_config "$REPO_DIR/waybar" "$CONFIG_DIR/waybar"
  link_config "$REPO_DIR/fuzzel" "$CONFIG_DIR/fuzzel"
  link_config "$REPO_DIR/mako" "$CONFIG_DIR/mako"
  link_config "$REPO_DIR/bin/screenshot-region" "$HOME/.local/bin/screenshot-region"
  link_config "$REPO_DIR/bin/clipboard-picker" "$HOME/.local/bin/clipboard-picker"
  link_config "$REPO_DIR/bin/session-menu" "$HOME/.local/bin/session-menu"
  link_config "$REPO_DIR/bin/screen-filter" "$HOME/.local/bin/screen-filter"
}

install_fonts() {
  link_config "$REPO_DIR/IBMPlexMono" "$DATA_DIR/fonts/BlexMonoNerdFont"
  fc-cache -f
  log "installed BlexMono Nerd Font for this user"
}

install_user_services() {
  local unit
  for unit in ssh-agent.service waybar.service cliphist-text.service cliphist-image.service; do
    link_config "$REPO_DIR/systemd/user/$unit" "$CONFIG_DIR/systemd/user/$unit"
  done
  systemctl --user daemon-reload
  systemctl --user enable --now \
    ssh-agent.service waybar.service cliphist-text.service cliphist-image.service \
    hypridle.service hyprpolkitagent.service
  log "enabled desktop and SSH user services"
}

if confirm "Install or update packages"; then
  install_packages
else
  log "skipped package installation"
fi

if [[ ! -r "$HOME/antigen.zsh" ]]; then
  curl -fsSL https://git.io/antigen > "$HOME/antigen.zsh"
fi

if [[ ! -d "$HOME/.tmux/plugins/tpm" ]]; then
  git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
fi

if ! git -C "$REPO_DIR" submodule update --init --remote --recursive; then
  log "warning: Neovim submodule update failed; continuing with the other dotfiles"
fi
install_core_configs

if [[ "$(uname -s)" == Linux ]] && command -v pacman >/dev/null 2>&1; then
  if confirm "Install Hyprland desktop configuration"; then
    install_hyprland_configs
  else
    log "skipped Hyprland desktop configuration"
  fi
fi

if confirm "Install bundled BlexMono Nerd Font"; then
  install_fonts
else
  log "skipped font installation"
fi

if [[ "$(uname -s)" == Linux ]] && command -v systemctl >/dev/null 2>&1; then
  if confirm "Install and enable user services"; then
    install_user_services
  else
    log "skipped user services"
  fi
fi

log "configuration installed"
log "run prefix-I inside tmux to install plugins"
log "log out and back into Hyprland if session components do not appear immediately"
