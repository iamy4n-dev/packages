---
name: "tui-power"
display_name: "TUI Power"
description: "Heavy TUI upgrades: terminal file manager, tmux session manager, and TUI fuzzy search. Optional due to size and personal preference."
status: stable
tags: [tui, optional, productivity, yazi, sesh, television]
tools: [yazi, sesh, television]
---

# tui-power

Optional coarse bundle for users who want a richer terminal UI experience.

| Tool | Purpose |
|------|---------|
| yazi | Terminal file manager with image preview |
| sesh | tmux session manager |
| television | TUI fuzzy finder (files, git, env vars, etc.) |

Add to your `dpod.yaml` via overrides:

```yaml
overrides:
  packages:
    add:
      - tui-power@v1.0.0
```
