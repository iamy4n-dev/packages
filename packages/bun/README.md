---
name: "bun"
display_name: "Bun"
description: "Installs bun — a fast all-in-one JavaScript runtime, bundler, and package manager."
status: stable
tags: [bun, javascript, typescript, runtime, bundler, frontend, frontend-web]
tools: [bun]
---

# bun

Installs [Bun](https://bun.sh) — a drop-in Node alternative and bundler. Kept as a separate fine-grained package because some teams use it as a full runtime replacement while others use it only as a bundler alongside Node.

Add to your `dpod.yaml` via overrides:

```yaml
overrides:
  packages:
    add:
      - bun@v1.0.0
```
