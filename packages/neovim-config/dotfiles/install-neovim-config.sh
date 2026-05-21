#!/usr/bin/env bash
set -euo pipefail

ARCH=$(uname -m)
case "$ARCH" in
    x86_64)  ARCH=x86_64 ;;
    aarch64) ARCH=arm64 ;;
esac

if command -v pacman &>/dev/null; then
    sudo pacman -S --noconfirm neovim
elif command -v apt-get &>/dev/null; then
    # neovim in debian stable is outdated; install from GitHub releases
    if ! command -v nvim &>/dev/null; then
        curl -fsSL "https://github.com/neovim/neovim/releases/latest/download/nvim-linux-${ARCH}.tar.gz" \
            | sudo tar -xz --strip-components=1 -C /usr/local
    fi
fi

if [ -f .devcontainer/init.lua ]; then
    mkdir -p ~/.config/nvim
    cp .devcontainer/init.lua ~/.config/nvim/init.lua
fi

echo "neovim-config installed"
