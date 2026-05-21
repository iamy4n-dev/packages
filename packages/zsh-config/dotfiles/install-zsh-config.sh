#!/usr/bin/env bash
set -euo pipefail

if command -v pacman &>/dev/null; then
    sudo pacman -S --noconfirm zsh
elif command -v apt-get &>/dev/null; then
    sudo apt-get update -qq && sudo apt-get install -y zsh
fi

# starship
if ! command -v starship &>/dev/null; then
    curl -fsSL https://starship.rs/install.sh | sudo sh -s -- --yes
fi

sudo chsh -s "$(command -v zsh)" "$(whoami)"

if [ -f .devcontainer/.zshrc ]; then
    cp .devcontainer/.zshrc ~/.zshrc
fi

if [ -f .devcontainer/starship.toml ]; then
    mkdir -p ~/.config
    cp .devcontainer/starship.toml ~/.config/starship.toml
fi

echo "zsh-config installed"
