#!/usr/bin/env bash
set -euo pipefail

KUBECTL_VERSION="v1.32.0"
HELM_VERSION="v3.17.0"
K9S_VERSION="v0.32.7"
KUSTOMIZE_VERSION="v5.4.3"

ARCH=$(uname -m)
case "$ARCH" in
    x86_64)  ARCH=amd64 ;;
    aarch64) ARCH=arm64 ;;
esac

# kubectl
if ! command -v kubectl &>/dev/null; then
    curl -fsSL "https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/${ARCH}/kubectl" -o /tmp/kubectl
    sudo install -o root -g root -m 0755 /tmp/kubectl /usr/local/bin/kubectl
    rm /tmp/kubectl
fi

# helm
if ! command -v helm &>/dev/null; then
    curl -fsSL https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
fi

# k9s
if ! command -v k9s &>/dev/null; then
    curl -fsSL "https://github.com/derailed/k9s/releases/download/${K9S_VERSION}/k9s_Linux_${ARCH}.tar.gz" \
        | sudo tar -xz -C /usr/local/bin k9s
fi

# kubectx + kubens
if ! command -v kubectx &>/dev/null; then
    if command -v pacman &>/dev/null; then
        sudo pacman -S --noconfirm kubectx
    else
        curl -fsSL "https://github.com/ahmetb/kubectx/releases/latest/download/kubectx_linux_${ARCH}.tar.gz" \
            | sudo tar -xz -C /usr/local/bin kubectx
        curl -fsSL "https://github.com/ahmetb/kubectx/releases/latest/download/kubens_linux_${ARCH}.tar.gz" \
            | sudo tar -xz -C /usr/local/bin kubens
    fi
fi

# kustomize
if ! command -v kustomize &>/dev/null; then
    curl -fsSL "https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2F${KUSTOMIZE_VERSION}/kustomize_${KUSTOMIZE_VERSION}_linux_${ARCH}.tar.gz" \
        | sudo tar -xz -C /usr/local/bin kustomize
fi

echo "k8s-tools installed"
