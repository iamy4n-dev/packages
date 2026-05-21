---
name: "neovim-config"
display_name: "Neovim"
description: "Installs neovim with a minimal config — no heavy plugin manager, just sane defaults."
status: stable
tags: [editor, neovim, vim, config, shared]
tools: [neovim]
---

# neovim-config

Installs neovim and applies a minimal `init.lua` from `.devcontainer/` if materialised by dpod-seed.

Intentionally minimal: no plugin manager, no LSP config. Distros that need language tooling should layer additional config on top.
