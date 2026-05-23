#!/usr/bin/env bash
set -euo pipefail

export NVM_DIR="${HOME}/.nvm"
# shellcheck source=/dev/null
[ -s "${NVM_DIR}/nvm.sh" ] && . "${NVM_DIR}/nvm.sh"

if ! command -v npm &>/dev/null; then
    echo "npm not found — ensure node-runtime package is installed first"
    exit 1
fi

if command -v pi &>/dev/null; then
    echo "pi already installed"
    exit 0
fi

npm install -g --ignore-scripts @earendil-works/pi-coding-agent

echo "ai-agent-pi installed"
