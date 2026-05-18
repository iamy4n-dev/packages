#!/usr/bin/env bash
# Install kubectl, helm, and k9s

set -euo pipefail

KUBECTL_VERSION="v1.32.0"
HELM_VERSION="v3.17.0"
K9S_VERSION="v0.32.7"

ARCH=$(uname -m)
case "$ARCH" in
    x86_64)  ARCH=amd64 ;;
    aarch64) ARCH=arm64 ;;
esac

# kubectl
if ! command -v kubectl &>/dev/null; then
    echo "Installing kubectl ${KUBECTL_VERSION}..."
    curl -fsSL "https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/${ARCH}/kubectl" -o /tmp/kubectl
    sudo install -o root -g root -m 0755 /tmp/kubectl /usr/local/bin/kubectl
fi

# helm
if ! command -v helm &>/dev/null; then
    echo "Installing helm ${HELM_VERSION}..."
    curl -fsSL https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
fi

# k9s
if ! command -v k9s &>/dev/null; then
    echo "Installing k9s ${K9S_VERSION}..."
    curl -fsSL "https://github.com/derailed/k9s/releases/download/${K9S_VERSION}/k9s_Linux_${ARCH}.tar.gz" \
        | sudo tar -xz -C /usr/local/bin k9s
fi

echo "k8s-tools installed: kubectl $(kubectl version --client -o json | python3 -c 'import sys,json; print(json.load(sys.stdin)["clientVersion"]["gitVersion"])' 2>/dev/null || echo '?'), helm $(helm version --short 2>/dev/null || echo '?'), k9s $(k9s version --short 2>/dev/null || echo '?')"
