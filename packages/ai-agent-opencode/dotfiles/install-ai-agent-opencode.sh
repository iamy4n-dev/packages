#!/usr/bin/env bash
set -euo pipefail

export NVM_DIR="${HOME}/.nvm"
# shellcheck source=/dev/null
[ -s "${NVM_DIR}/nvm.sh" ] && . "${NVM_DIR}/nvm.sh"

if ! command -v npm &>/dev/null; then
    echo "npm not found — ensure node-runtime package is installed first"
    exit 1
fi

if command -v opencode &>/dev/null; then
    echo "opencode already installed: $(opencode --version 2>/dev/null || echo '?')"
    exit 0
fi

npm install -g opencode

echo "ai-agent-opencode installed: $(opencode --version 2>/dev/null || echo '?')"
