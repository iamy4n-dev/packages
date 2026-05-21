#!/usr/bin/env bash
set -euo pipefail

# playwright CLI (global, framework deps stay per-project)
if ! command -v playwright &>/dev/null; then
    npm install -g playwright
fi

# chromium + its OS deps
if ! command -v chromium &>/dev/null && ! command -v chromium-browser &>/dev/null; then
    if command -v pacman &>/dev/null; then
        sudo pacman -S --noconfirm chromium
    elif command -v apt-get &>/dev/null; then
        sudo apt-get update -qq && sudo apt-get install -y chromium
    fi
fi

# install playwright's browser binaries (uses system chromium when available)
playwright install --with-deps chromium 2>/dev/null || true

echo "browser-test installed"
