#!/usr/bin/env bash
set -euo pipefail

ARCH=$(uname -m)
case "$ARCH" in
    x86_64)  ARCH=amd64 ;;
    aarch64) ARCH=arm64 ;;
esac

# dive
if ! command -v dive &>/dev/null; then
    if command -v pacman &>/dev/null; then
        sudo pacman -S --noconfirm dive
    else
        DIVE_VERSION=$(curl -fsSL https://api.github.com/repos/wagoodman/dive/releases/latest \
            | python3 -c 'import sys,json; print(json.load(sys.stdin)["tag_name"][1:])')
        curl -fsSL "https://github.com/wagoodman/dive/releases/download/v${DIVE_VERSION}/dive_${DIVE_VERSION}_linux_${ARCH}.tar.gz" \
            | sudo tar -xz -C /usr/local/bin dive
    fi
fi

# ctop
if ! command -v ctop &>/dev/null; then
    curl -fsSL "https://github.com/bcicen/ctop/releases/latest/download/ctop-linux-${ARCH}" \
        -o /tmp/ctop
    sudo install -m 0755 /tmp/ctop /usr/local/bin/ctop
    rm /tmp/ctop
fi

# lazydocker
if ! command -v lazydocker &>/dev/null; then
    curl -fsSL "https://github.com/jesseduffield/lazydocker/releases/latest/download/lazydocker_linux_${ARCH}.tar.gz" \
        | sudo tar -xz -C /usr/local/bin lazydocker
fi

echo "container-inspect installed"
