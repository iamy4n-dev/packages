#!/usr/bin/env bash
set -euo pipefail

ARCH=$(uname -m)
case "$ARCH" in
    x86_64)  ARCH=amd64 ;;
    aarch64) ARCH=arm64 ;;
esac

# terraform
if ! command -v terraform &>/dev/null; then
    if command -v pacman &>/dev/null; then
        sudo pacman -S --noconfirm terraform
    else
        TERRAFORM_VERSION=$(curl -fsSL https://checkpoint-api.hashicorp.com/v1/check/terraform | python3 -c 'import sys,json; print(json.load(sys.stdin)["current_version"])')
        curl -fsSL "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_${ARCH}.zip" \
            -o /tmp/terraform.zip
        sudo unzip -qo /tmp/terraform.zip -d /usr/local/bin terraform
        rm /tmp/terraform.zip
    fi
fi

# terragrunt
if ! command -v terragrunt &>/dev/null; then
    curl -fsSL "https://github.com/gruntwork-io/terragrunt/releases/latest/download/terragrunt_linux_${ARCH}" \
        -o /tmp/terragrunt
    sudo install -m 0755 /tmp/terragrunt /usr/local/bin/terragrunt
    rm /tmp/terragrunt
fi

# ansible
if ! command -v ansible &>/dev/null; then
    if command -v pacman &>/dev/null; then
        sudo pacman -S --noconfirm ansible
    elif command -v apt-get &>/dev/null; then
        sudo apt-get update -qq && sudo apt-get install -y ansible
    else
        pip3 install --user ansible
    fi
fi

echo "iac-tools installed"
