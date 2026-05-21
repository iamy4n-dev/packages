---
name: "fish-config"
display_name: "Fish Shell"
description: "Installs fish shell with a base config. Optional due to POSIX incompatibility with many devcontainer setup scripts."
status: stable
tags: [shell, fish, optional, config]
tools: [fish]
---

# fish-config

Installs [fish shell](https://fishshell.com) with a minimal `config.fish`.

> **POSIX compatibility caveat:** Fish is not POSIX-compliant. Many devcontainer `postCreateCommand` scripts and `install.sh` files use POSIX-only syntax (`export VAR=value`, `[ -f file ]`, etc.) that fish cannot execute directly. If you use `fish-config`, ensure your install scripts use `#!/usr/bin/env bash` shebangs explicitly. Fish is set as the interactive shell only — non-interactive scripts continue to run under bash/sh.

Add to your `dpod.yaml` via overrides:

```yaml
overrides:
  packages:
    add:
      - fish-config@v1.0.0
```
