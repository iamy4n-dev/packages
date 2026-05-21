---
name: "argocd"
display_name: "Argo CD CLI"
description: "Installs the Argo CD CLI for GitOps continuous delivery on Kubernetes."
status: stable
tags: [argocd, gitops, kubernetes, devops, platform-eng]
tools: [argocd]
---

# argocd

Installs the [Argo CD CLI](https://argo-cd.readthedocs.io) — an override alternative to `flux` in the `y4n/platform-eng-base` distro.

Add to your `dpod.yaml` via overrides:

```yaml
overrides:
  packages:
    replace:
      flux: argocd@v1.0.0
```
