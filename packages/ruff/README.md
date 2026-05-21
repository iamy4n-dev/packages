---
name: "ruff"
display_name: "Ruff"
description: "Installs ruff — an extremely fast Python linter and formatter written in Rust."
status: stable
tags: [python, linting, formatting, ruff, backend, python-backend]
tools: [ruff]
---

# ruff

Installs [ruff](https://docs.astral.sh/ruff/) — replaces flake8, isort, pyupgrade, and black in a single binary.

Add to your `dpod.yaml` via overrides:

```yaml
overrides:
  packages:
    add:
      - ruff@v1.0.0
```
