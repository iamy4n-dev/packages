#!/usr/bin/env bash
set -euo pipefail

# psql (postgresql-client)
if ! command -v psql &>/dev/null; then
    if command -v pacman &>/dev/null; then
        sudo pacman -S --noconfirm postgresql-libs
    elif command -v apt-get &>/dev/null; then
        sudo apt-get update -qq && sudo apt-get install -y postgresql-client
    fi
fi

# redis-cli
if ! command -v redis-cli &>/dev/null; then
    if command -v pacman &>/dev/null; then
        sudo pacman -S --noconfirm redis
    elif command -v apt-get &>/dev/null; then
        sudo apt-get update -qq && sudo apt-get install -y redis-tools
    fi
fi

# mycli (pip — not in most distro repos at a recent version)
if ! command -v mycli &>/dev/null; then
    pip3 install --user mycli
fi

echo "db-clients installed"
