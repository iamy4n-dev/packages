# packages

Tool bundles consumed by [dpod-seed](https://github.com/duyanh-y4n/dpod-seed) distros.

## Layout

```
packages/
  <name>/
    dotfiles/       # files materialised to .devcontainer/ in the target project
    manifest.yaml   # optional: override destination for specific files
```

Files under `dotfiles/` are placed into `.devcontainer/` preserving the relative
path. Use `manifest.yaml` only when a file needs a non-standard destination.

## Adding a bundle

1. Run `dpod-seed scaffold package <name>` in this repo to generate the layout.
2. Add your dotfiles under `packages/<name>/dotfiles/`.
3. Open a PR — CI validates structure and manifest YAML.
4. Tag `vX.Y.Z` to publish; distros pin to this tag.

## Bundles

| Bundle | Description |
|--------|-------------|
| `shell-zsh` | Zsh with sensible defaults |
| `k8s-tools` | kubectl, helm, k9s |
| `aws-cli` | AWS CLI v2 |
