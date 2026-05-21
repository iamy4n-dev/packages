#!/usr/bin/env bash
set -euo pipefail

# pyenv build deps
if command -v apt-get &>/dev/null; then
    sudo apt-get update -qq && sudo apt-get install -y \
        build-essential libssl-dev zlib1g-dev libbz2-dev \
        libreadline-dev libsqlite3-dev libncursesw5-dev \
        xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
elif command -v pacman &>/dev/null; then
    sudo pacman -S --noconfirm base-devel openssl zlib bzip2 readline sqlite ncurses xz tk libxml2 libxmlsec libffi
fi

# pyenv
if [ ! -d "${HOME}/.pyenv" ]; then
    curl -fsSL https://pyenv.run | bash
fi

export PYENV_ROOT="${HOME}/.pyenv"
export PATH="${PYENV_ROOT}/bin:${PATH}"

# uv
if ! command -v uv &>/dev/null; then
    curl -fsSL https://astral.sh/uv/install.sh | sh
fi

# pipx
if ! command -v pipx &>/dev/null; then
    if command -v apt-get &>/dev/null; then
        sudo apt-get install -y pipx
    elif command -v pacman &>/dev/null; then
        sudo pacman -S --noconfirm python-pipx
    else
        pip3 install --user pipx
    fi
fi

echo "python-runtime installed"
