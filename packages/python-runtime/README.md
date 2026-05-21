---
name: "python-runtime"
display_name: "Python Runtime"
description: "Installs pyenv, uv, and pipx for Python version management and isolated tool installation."
status: stable
tags: [python, pyenv, uv, pipx, backend, python-backend]
tools: [pyenv, uv, pipx]
---

# python-runtime

Installs the Python toolchain. Per-project dependencies (`pytest`, `coverage`, etc.) are managed by each project's `pyproject.toml`, not the devcontainer.

| Tool | Purpose |
|------|---------|
| pyenv | Manage multiple Python versions |
| uv | Fast Python package and project manager |
| pipx | Install and run Python CLI tools in isolated environments |
