#!/usr/bin/env bash
set -euo pipefail

if command -v pacman &>/dev/null; then
    sudo pacman -S --noconfirm fish
elif command -v apt-get &>/dev/null; then
    sudo apt-get update -qq && sudo apt-get install -y fish
fi

# Set fish as interactive shell without changing the login shell
# (avoids breaking POSIX scripts run during devcontainer setup)
mkdir -p ~/.config/fish

if [ -f .devcontainer/config.fish ]; then
    cp .devcontainer/config.fish ~/.config/fish/config.fish
fi

echo "fish-config installed (interactive shell only — login shell unchanged)"
