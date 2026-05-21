#!/usr/bin/env bash
set -euo pipefail

ARCH=$(uname -m)
case "$ARCH" in
    x86_64)  ARCH=x86_64 ;;
    aarch64) ARCH=arm64 ;;
esac

# curl (almost always present, but ensure it's installed)
if ! command -v curl &>/dev/null; then
    if command -v apt-get &>/dev/null; then
        sudo apt-get update -qq && sudo apt-get install -y curl
    elif command -v pacman &>/dev/null; then
        sudo pacman -S --noconfirm curl
    fi
fi

# httpie
if ! command -v http &>/dev/null; then
    if command -v pacman &>/dev/null; then
        sudo pacman -S --noconfirm httpie
    elif command -v apt-get &>/dev/null; then
        sudo apt-get update -qq && sudo apt-get install -y httpie
    else
        pip3 install --user httpie
    fi
fi

# grpcurl
if ! command -v grpcurl &>/dev/null; then
    curl -fsSL "https://github.com/fullstorydev/grpcurl/releases/latest/download/grpcurl_linux_${ARCH}.tar.gz" \
        | sudo tar -xz -C /usr/local/bin grpcurl
fi

echo "api-dev installed"
