#!/usr/bin/env bash
set -euo pipefail

if command -v gcloud &>/dev/null; then
    echo "gcloud already installed: $(gcloud version --format='value(Google Cloud SDK)' 2>/dev/null || echo '?')"
    exit 0
fi

ARCH=$(uname -m)
case "$ARCH" in
    x86_64)  ARCH=x86_64 ;;
    aarch64) ARCH=arm ;;
esac

if command -v pacman &>/dev/null; then
    sudo pacman -S --noconfirm google-cloud-cli
else
    curl -fsSL "https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-linux-${ARCH}.tar.gz" \
        -o /tmp/gcloud.tar.gz
    sudo tar -xz -C /opt -f /tmp/gcloud.tar.gz
    sudo /opt/google-cloud-sdk/install.sh --quiet --path-update true
    sudo ln -sf /opt/google-cloud-sdk/bin/gcloud /usr/local/bin/gcloud
    sudo ln -sf /opt/google-cloud-sdk/bin/gsutil /usr/local/bin/gsutil
    sudo ln -sf /opt/google-cloud-sdk/bin/bq /usr/local/bin/bq
    rm /tmp/gcloud.tar.gz
fi

echo "gcloud installed"
