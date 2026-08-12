#!/usr/bin/env bash
set -Eeuo pipefail

REPO_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}"
STAMP="$(date +%Y%m%d%H%M%S)"

log() { printf '[setup] %s\n' "$*"; }
die() { printf '[setup] error: %s\n' "$*" >&2; exit 1; }

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
        sudo pacman -Sy --needed --noconfirm git curl zsh tmux neovim alacritty
      else
        die "unsupported Linux distribution: install git, curl, zsh, tmux, neovim, and alacritty manually"
      fi
      ;;
    *) die "only macOS and Linux are supported" ;;
  esac
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
  fi
}

install_packages

if [[ ! -r "$HOME/antigen.zsh" ]]; then
  curl -fsSL https://git.io/antigen > "$HOME/antigen.zsh"
fi

if [[ ! -d "$HOME/.tmux/plugins/tpm" ]]; then
  git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
fi

git -C "$REPO_DIR" submodule update --init --recursive

link_config "$REPO_DIR/zshrc" "$HOME/.zshrc"
link_config "$REPO_DIR/tmux.conf" "$HOME/.tmux.conf"
link_config "$REPO_DIR/alacritty.toml" "$CONFIG_DIR/alacritty/alacritty.toml"
link_config "$REPO_DIR/nvim" "$CONFIG_DIR/nvim"

log "configuration installed; run prefix-I inside tmux to install plugins"
