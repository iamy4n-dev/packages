#!/usr/bin/env bash
set -euo pipefail

if command -v flux &>/dev/null; then
    echo "flux already installed: $(flux version --client 2>/dev/null | head -1 || echo '?')"
    exit 0
fi

curl -fsSL https://fluxcd.io/install.sh | sudo bash

echo "flux installed"
