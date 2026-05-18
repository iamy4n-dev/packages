#!/usr/bin/env bash
# Install AWS CLI v2

set -euo pipefail

if command -v aws &>/dev/null; then
    echo "AWS CLI already installed: $(aws --version)"
    exit 0
fi

ARCH=$(uname -m)
case "$ARCH" in
    x86_64)  ARCH=x86_64 ;;
    aarch64) ARCH=aarch64 ;;
esac

echo "Installing AWS CLI v2 (${ARCH})..."
curl -fsSL "https://awscli.amazonaws.com/awscli-exe-linux-${ARCH}.zip" -o /tmp/awscliv2.zip
unzip -q /tmp/awscliv2.zip -d /tmp/awscli
sudo /tmp/awscli/aws/install
rm -rf /tmp/awscliv2.zip /tmp/awscli

echo "AWS CLI installed: $(aws --version)"
