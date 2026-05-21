#!/usr/bin/env bash
set -euo pipefail

ARCH=$(uname -m)
case "$ARCH" in
    x86_64)  ARCH=amd64 ;;
    aarch64) ARCH=arm64 ;;
esac

# docker
if ! command -v docker &>/dev/null; then
    if command -v pacman &>/dev/null; then
        sudo pacman -S --noconfirm docker docker-compose
        sudo systemctl enable docker
    else
        curl -fsSL https://get.docker.com | sudo sh
        sudo apt-get install -y docker-compose-plugin
    fi
fi

# buildkit (buildctl)
if ! command -v buildctl &>/dev/null; then
    BUILDKIT_VERSION=$(curl -fsSL https://api.github.com/repos/moby/buildkit/releases/latest \
        | python3 -c 'import sys,json; print(json.load(sys.stdin)["tag_name"])')
    curl -fsSL "https://github.com/moby/buildkit/releases/download/${BUILDKIT_VERSION}/buildkit-${BUILDKIT_VERSION}.linux-${ARCH}.tar.gz" \
        | sudo tar -xz -C /usr/local bin/buildctl
fi

echo "docker-tools installed"
