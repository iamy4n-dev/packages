#!/usr/bin/env bash
# Install zsh and apply config from .devcontainer/.zshrc if present

set -euo pipefail

if command -v pacman &>/dev/null; then
    sudo pacman -S --noconfirm zsh
elif command -v apt-get &>/dev/null; then
    sudo apt-get install -y zsh
fi

# Change default shell
sudo chsh -s "$(command -v zsh)" "$(whoami)"

# Apply zshrc if materialised by dpod-seed
if [ -f .devcontainer/.zshrc ]; then
    cp .devcontainer/.zshrc ~/.zshrc
fi
