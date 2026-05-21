#!/usr/bin/env bash
set -euo pipefail

ARCH=$(uname -m)
case "$ARCH" in
    x86_64)  ARCH=amd64 ;;
    aarch64) ARCH=arm64 ;;
esac

if command -v pacman &>/dev/null; then
    sudo pacman -S --noconfirm lazygit git-delta github-cli
elif command -v apt-get &>/dev/null; then
    sudo apt-get update -qq
    # gh CLI
    if ! command -v gh &>/dev/null; then
        curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg \
            | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
        echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" \
            | sudo tee /etc/apt/sources.list.d/github-cli.list
        sudo apt-get update -qq && sudo apt-get install -y gh
    fi
    # lazygit
    if ! command -v lazygit &>/dev/null; then
        LG_VERSION=$(curl -fsSL https://api.github.com/repos/jesseduffield/lazygit/releases/latest | grep '"tag_name"' | cut -d'"' -f4)
        curl -fsSL "https://github.com/jesseduffield/lazygit/releases/download/${LG_VERSION}/lazygit_${LG_VERSION#v}_Linux_x86_64.tar.gz" \
            | sudo tar -xz -C /usr/local/bin lazygit
    fi
    # delta
    if ! command -v delta &>/dev/null; then
        DL_VERSION=$(curl -fsSL https://api.github.com/repos/dandavison/delta/releases/latest | grep '"tag_name"' | cut -d'"' -f4)
        curl -fsSL "https://github.com/dandavison/delta/releases/download/${DL_VERSION}/delta-${DL_VERSION}-x86_64-unknown-linux-musl.tar.gz" \
            | sudo tar -xz --strip-components=1 -C /usr/local/bin "delta-${DL_VERSION}-x86_64-unknown-linux-musl/delta"
    fi
fi

echo "git-extras installed"
