#!/usr/bin/env bash
set -euo pipefail

HOST="${1:-nixos}"
REPO_URL="${REPO_URL:-https://github.com/YOURUSER/nix-config.git}"
DEST="$HOME/nix-config"

if [ "$(id -u)" -eq 0 ]; then
  echo "Run this as your normal user, not root." >&2
  exit 1
fi

if ! command -v git >/dev/null 2>&1; then
  exec nix-shell -p git --run "bash '$(realpath "$0")' $*"
fi

export NIX_CONFIG="experimental-features = nix-command flakes"

if [ ! -d "$DEST/.git" ]; then
  git clone "$REPO_URL" "$DEST"
fi
cd "$DEST"

if [ ! -f "hosts/$HOST/default.nix" ]; then
  echo "No hosts/$HOST/default.nix. Copy an existing host folder and edit it." >&2
  exit 1
fi

if [ ! -d "$HOME/.config/nvim" ]; then
  git clone https://codeberg.org/sonakrie/neovim.git "$HOME/.config/nvim"
fi

HW="hosts/$HOST/hardware-configuration.nix"
if [ ! -f "$HW" ] || [ "${REGEN_HW:-0}" = 1 ]; then
  echo "Generating $HW"
  sudo nixos-generate-config --show-hardware-config > "$HW"
fi

git add -A

sudo env NIX_CONFIG="$NIX_CONFIG" nixos-rebuild switch --flake ".#$HOST"

cat <<MSG

Done. Log out and back in with the plain "Hyprland" session, then run matugen
once so hypr/hyprcolors.lua and the other generated theme files exist.
MSG
