# Binary Beam Homebrew Tap

Homebrew cask for [AssetSnap](https://assetsnap.binarybeam.net) — developer assets
from your macOS menu bar.

## Install

```sh
brew install --cask binary-beam/tap/assetsnap
```

That's it — Homebrew auto-taps from the qualified name, downloads the latest `.dmg`,
installs `AssetSnap.app` into `/Applications`, and launches without a Gatekeeper
prompt.

## Update

```sh
brew upgrade --cask assetsnap
```

## Uninstall

```sh
brew uninstall --cask assetsnap          # remove the app
brew uninstall --zap --cask assetsnap    # also clear preferences/caches
```

## Notes

AssetSnap is currently an **unsigned beta** (not yet notarized). The cask removes the
`com.apple.quarantine` flag on install so the app opens cleanly — this bypasses
Gatekeeper's notarization check rather than passing it. Requires macOS 14 (Sonoma) or
later, on Apple Silicon or Intel.

The cask's `version` and `sha256` are bumped automatically on each release by
`scripts/release.sh` in the AssetSnap source repo.
