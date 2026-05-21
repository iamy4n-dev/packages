#!/usr/bin/env bash
set -euo pipefail

if command -v ruff &>/dev/null; then
    echo "ruff already installed: $(ruff --version)"
    exit 0
fi

curl -fsSL https://astral.sh/ruff/install.sh | sh

echo "ruff installed"
