---
name: "node-runtime"
display_name: "Node.js Runtime"
description: "Installs nvm, Node.js LTS, and corepack for managing Node versions and package managers."
status: stable
tags: [node, nodejs, nvm, corepack, pnpm, yarn, frontend, frontend-web]
tools: [node, npm, nvm, corepack]
---

# node-runtime

Installs Node.js via nvm with corepack enabled, giving access to pnpm and yarn without separate installs. Per-project dependencies are managed by each project's `package.json`.

| Tool | Purpose |
|------|---------|
| nvm | Node version manager |
| node / npm | Node.js LTS runtime and package manager |
| corepack | Enables pnpm and yarn without separate installs |
