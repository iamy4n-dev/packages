---
name: "zsh-config"
display_name: "Zsh + Starship"
description: "Installs zsh and the Starship prompt, with a base config for all y4n distros."
status: stable
tags: [shell, zsh, starship, prompt, config, shared]
tools: [zsh, starship]
---

# zsh-config

Installs zsh and [Starship](https://starship.rs) with a minimal config suited for devcontainer use.

Config files materialised into `.devcontainer/`:
- `.zshrc` — base zsh config with Starship init
- `starship.toml` — minimal Starship theme
