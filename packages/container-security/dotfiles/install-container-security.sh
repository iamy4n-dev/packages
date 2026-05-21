#!/usr/bin/env bash
set -euo pipefail

ARCH=$(uname -m)
case "$ARCH" in
    x86_64)  ARCH=amd64 ;;
    aarch64) ARCH=arm64 ;;
esac

# trivy
if ! command -v trivy &>/dev/null; then
    if command -v pacman &>/dev/null; then
        sudo pacman -S --noconfirm trivy
    else
        curl -fsSL https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/install.sh \
            | sudo sh -s -- -b /usr/local/bin
    fi
fi

# hadolint
if ! command -v hadolint &>/dev/null; then
    if command -v pacman &>/dev/null; then
        sudo pacman -S --noconfirm hadolint
    else
        curl -fsSL "https://github.com/hadolint/hadolint/releases/latest/download/hadolint-Linux-${ARCH}" \
            -o /tmp/hadolint
        sudo install -m 0755 /tmp/hadolint /usr/local/bin/hadolint
        rm /tmp/hadolint
    fi
fi

echo "container-security installed"
