#!/usr/bin/env bash
set -euo pipefail

# requires node/npm — install node-runtime first
if ! command -v npm &>/dev/null; then
    echo "ERROR: npm not found — install node-runtime first" >&2
    exit 1
fi

if ! command -v eslint &>/dev/null; then
    npm install -g eslint
fi

if ! command -v prettier &>/dev/null; then
    npm install -g prettier
fi

echo "js-linting installed"
