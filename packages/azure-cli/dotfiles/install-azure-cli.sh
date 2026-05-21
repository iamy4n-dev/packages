#!/usr/bin/env bash
set -euo pipefail

if command -v az &>/dev/null; then
    echo "azure-cli already installed: $(az version --query '"azure-cli"' -o tsv 2>/dev/null || echo '?')"
    exit 0
fi

if command -v pacman &>/dev/null; then
    sudo pacman -S --noconfirm python-azure-cli
else
    curl -fsSL https://aka.ms/InstallAzureCLIDeb | sudo bash
fi

echo "azure-cli installed"
