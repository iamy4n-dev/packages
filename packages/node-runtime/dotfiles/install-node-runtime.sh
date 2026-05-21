#!/usr/bin/env bash
set -euo pipefail

NVM_VERSION="v0.40.1"

# nvm
if [ ! -d "${HOME}/.nvm" ]; then
    curl -fsSL "https://raw.githubusercontent.com/nvm-sh/nvm/${NVM_VERSION}/install.sh" | bash
fi

export NVM_DIR="${HOME}/.nvm"
# shellcheck source=/dev/null
[ -s "${NVM_DIR}/nvm.sh" ] && . "${NVM_DIR}/nvm.sh"

# node LTS
if ! command -v node &>/dev/null; then
    nvm install --lts
    nvm use --lts
    nvm alias default 'lts/*'
fi

# corepack (ships with Node >=16.9, just needs enabling)
if command -v corepack &>/dev/null; then
    corepack enable
fi

echo "node-runtime installed: $(node --version 2>/dev/null || echo '?')"
