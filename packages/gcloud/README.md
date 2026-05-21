---
name: "gcloud"
display_name: "Google Cloud SDK"
description: "Installs the gcloud CLI for interacting with Google Cloud Platform services."
status: stable
tags: [gcp, google-cloud, cloud, devops, platform-eng]
tools: [gcloud, gsutil, bq]
---

# gcloud

Installs the [Google Cloud SDK](https://cloud.google.com/sdk), including `gcloud`, `gsutil`, and `bq`.

Available as an override alternative to `aws-cli` in the `y4n/platform-eng-base` distro.

Add to your `dpod.yaml` via overrides:

```yaml
overrides:
  packages:
    add:
      - gcloud@v1.0.0
```
