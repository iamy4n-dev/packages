#!/usr/bin/env bash
set -euo pipefail

ARCH=$(uname -m)
case "$ARCH" in
    x86_64)  ARCH=x86_64 ;;
    aarch64) ARCH=arm64 ;;
esac

# crane
if ! command -v crane &>/dev/null; then
    CRANE_ARCH="${ARCH}"
    case "$CRANE_ARCH" in
        x86_64) CRANE_ARCH=x86_64 ;;
    esac
    curl -fsSL "https://github.com/google/go-containerregistry/releases/latest/download/go-containerregistry_Linux_${CRANE_ARCH}.tar.gz" \
        | sudo tar -xz -C /usr/local/bin crane
fi

# skopeo
if ! command -v skopeo &>/dev/null; then
    if command -v pacman &>/dev/null; then
        sudo pacman -S --noconfirm skopeo
    elif command -v apt-get &>/dev/null; then
        sudo apt-get update -qq && sudo apt-get install -y skopeo
    fi
fi

echo "registry-tools installed"
