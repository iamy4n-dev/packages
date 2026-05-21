#!/usr/bin/env bash
set -euo pipefail

if command -v bun &>/dev/null; then
    echo "bun already installed: $(bun --version)"
    exit 0
fi

curl -fsSL https://bun.sh/install | bash

echo "bun installed"
