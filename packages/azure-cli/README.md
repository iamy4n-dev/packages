---
name: "azure-cli"
display_name: "Azure CLI"
description: "Installs the Azure CLI for interacting with Microsoft Azure services."
status: stable
tags: [azure, microsoft, cloud, devops, platform-eng]
tools: [az]
---

# azure-cli

Installs the [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/) (`az`).

Available as an override alternative to `aws-cli` in the `y4n/platform-eng-base` distro.

Add to your `dpod.yaml` via overrides:

```yaml
overrides:
  packages:
    add:
      - azure-cli@v1.0.0
```
