#!/usr/bin/env bash
set -euo pipefail

ARCH=$(uname -m)
case "$ARCH" in
    x86_64)  ARCH=amd64 ;;
    aarch64) ARCH=arm64 ;;
esac

if command -v pacman &>/dev/null; then
    sudo pacman -S --noconfirm \
        zoxide eza fzf tealdeer atuin ripgrep jq bat tmux make
    # yq via binary (AUR alternative)
    if ! command -v yq &>/dev/null; then
        curl -fsSL "https://github.com/mikefarah/yq/releases/latest/download/yq_linux_${ARCH}" \
            | sudo install -m 0755 /dev/stdin /usr/local/bin/yq
    fi
elif command -v apt-get &>/dev/null; then
    sudo apt-get update -qq
    sudo apt-get install -y --no-install-recommends \
        fzf ripgrep jq bat tmux make curl
    # zoxide
    if ! command -v zoxide &>/dev/null; then
        curl -fsSL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
    fi
    # eza
    if ! command -v eza &>/dev/null; then
        curl -fsSL "https://github.com/eza-community/eza/releases/latest/download/eza_linux_${ARCH}.tar.gz" \
            | sudo tar -xz -C /usr/local/bin eza
    fi
    # atuin
    if ! command -v atuin &>/dev/null; then
        curl -fsSL https://setup.atuin.sh | bash
    fi
    # tldr
    if ! command -v tldr &>/dev/null; then
        curl -fsSL "https://github.com/dbrgn/tealdeer/releases/latest/download/tealdeer-linux-${ARCH}-musl" \
            | sudo install -m 0755 /dev/stdin /usr/local/bin/tldr
    fi
    # yq
    if ! command -v yq &>/dev/null; then
        curl -fsSL "https://github.com/mikefarah/yq/releases/latest/download/yq_linux_${ARCH}" \
            | sudo install -m 0755 /dev/stdin /usr/local/bin/yq
    fi
fi

echo "cli-essentials installed"
