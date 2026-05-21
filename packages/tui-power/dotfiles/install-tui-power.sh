#!/usr/bin/env bash
set -euo pipefail

ARCH=$(uname -m)
case "$ARCH" in
    x86_64)  ARCH=amd64 ;;
    aarch64) ARCH=arm64 ;;
esac

# yazi
if ! command -v yazi &>/dev/null; then
    if command -v pacman &>/dev/null; then
        sudo pacman -S --noconfirm yazi
    else
        curl -fsSL "https://github.com/sxyazi/yazi/releases/latest/download/yazi-x86_64-unknown-linux-musl.zip" \
            -o /tmp/yazi.zip
        unzip -qo /tmp/yazi.zip -d /tmp/yazi
        sudo install -m 0755 /tmp/yazi/yazi-x86_64-unknown-linux-musl/yazi /usr/local/bin/yazi
        rm -rf /tmp/yazi /tmp/yazi.zip
    fi
fi

# sesh (tmux session manager)
if ! command -v sesh &>/dev/null; then
    curl -fsSL "https://github.com/joshmedeski/sesh/releases/latest/download/sesh_Linux_${ARCH}.tar.gz" \
        | sudo tar -xz -C /usr/local/bin sesh
fi

# television
if ! command -v tv &>/dev/null; then
    curl -fsSL "https://github.com/alexpasmantier/television/releases/latest/download/tv-linux-${ARCH}.tar.gz" \
        | sudo tar -xz -C /usr/local/bin tv
fi

echo "tui-power installed"
