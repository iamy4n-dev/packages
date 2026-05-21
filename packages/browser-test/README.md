---
name: "browser-test"
display_name: "Browser Testing"
description: "Installs the Playwright CLI and Chromium for headless browser testing in CI and devcontainers."
status: stable
tags: [playwright, chromium, browser, testing, e2e, frontend, frontend-web]
tools: [playwright, chromium]
---

# browser-test

Installs [Playwright](https://playwright.dev) and a headless Chromium browser. Per-project test framework deps (`@playwright/test`, etc.) are managed by each project's `package.json`.

| Tool | Purpose |
|------|---------|
| playwright | CLI for browser automation and test execution |
| chromium | Headless browser for CI-compatible e2e testing |
