#!/usr/bin/env bash
set -euo pipefail

PROMETHEUS_VERSION="2.51.2"
GRAFANA_VERSION="11.0.0"

ARCH=$(uname -m)
case "$ARCH" in
    x86_64)  ARCH=amd64 ;;
    aarch64) ARCH=arm64 ;;
esac

# promtool (ships with prometheus)
if ! command -v promtool &>/dev/null; then
    if command -v pacman &>/dev/null; then
        sudo pacman -S --noconfirm prometheus
    else
        curl -fsSL "https://github.com/prometheus/prometheus/releases/download/v${PROMETHEUS_VERSION}/prometheus-${PROMETHEUS_VERSION}.linux-${ARCH}.tar.gz" \
            | sudo tar -xz --strip-components=1 -C /usr/local/bin \
                "prometheus-${PROMETHEUS_VERSION}.linux-${ARCH}/promtool"
    fi
fi

# grafana-cli (ships with grafana)
if ! command -v grafana-cli &>/dev/null; then
    if command -v pacman &>/dev/null; then
        sudo pacman -S --noconfirm grafana
    else
        curl -fsSL "https://dl.grafana.com/oss/release/grafana-${GRAFANA_VERSION}.linux-${ARCH}.tar.gz" \
            | sudo tar -xz --strip-components=2 -C /usr/local/bin \
                "grafana-v${GRAFANA_VERSION}/bin/grafana-cli"
    fi
fi

# stern
if ! command -v stern &>/dev/null; then
    curl -fsSL "https://github.com/stern/stern/releases/latest/download/stern_linux_${ARCH}.tar.gz" \
        | sudo tar -xz -C /usr/local/bin stern
fi

echo "observability installed"
