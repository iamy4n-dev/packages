#!/usr/bin/env bash
set -euo pipefail

if command -v argocd &>/dev/null; then
    echo "argocd already installed: $(argocd version --client --short 2>/dev/null || echo '?')"
    exit 0
fi

ARCH=$(uname -m)
case "$ARCH" in
    x86_64)  ARCH=amd64 ;;
    aarch64) ARCH=arm64 ;;
esac

curl -fsSL "https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-${ARCH}" \
    -o /tmp/argocd
sudo install -m 0755 /tmp/argocd /usr/local/bin/argocd
rm /tmp/argocd

echo "argocd installed"
