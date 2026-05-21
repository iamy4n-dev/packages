---
name: "flux"
display_name: "Flux CLI"
description: "Installs the Flux CLI for GitOps continuous delivery on Kubernetes."
status: stable
tags: [flux, gitops, kubernetes, devops, platform-eng]
tools: [flux]
---

# flux

Installs the [Flux CLI](https://fluxcd.io) — the default GitOps tool in the `y4n/platform-eng-base` distro.

Use `argocd` as an override alternative if you prefer Argo CD.

Add to your `dpod.yaml` via overrides:

```yaml
overrides:
  packages:
    add:
      - flux@v1.0.0
```
