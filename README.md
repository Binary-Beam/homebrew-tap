# Binary Beam Homebrew Tap

Homebrew casks for Binary Beam's macOS apps. Add the tap once and install any
app with a single command — no separate tap step needed, Homebrew auto-taps from
the qualified cask name.

## Apps

| App | Install |
|-----|---------|
| [AssetSnap](https://assetsnap.binarybeam.net) — developer assets from your menu bar | `brew install --cask binary-beam/tap/assetsnap` |

More to come — each new app is added as its own cask under `Casks/`.

## Install

```sh
brew install --cask binary-beam/tap/<app>
```

For example, AssetSnap:

```sh
brew install --cask binary-beam/tap/assetsnap
```

Downloads the latest `.dmg`, installs the app into `/Applications`, and launches
it without a Gatekeeper prompt.

## Update

```sh
brew upgrade --cask <app>     # e.g. brew upgrade --cask assetsnap
```

## Uninstall

```sh
brew uninstall --cask <app>          # remove the app
brew uninstall --zap --cask <app>    # also clear preferences/caches
```

## Notes

- **AssetSnap** is currently an unsigned beta (not yet notarized). Its cask
  removes the `com.apple.quarantine` flag on install so the app opens cleanly —
  this bypasses Gatekeeper's notarization check rather than passing it. Requires
  macOS 14 (Sonoma) or later, on Apple Silicon or Intel.
- Each app's cask `version` and `sha256` are bumped automatically on release by
  that app's `scripts/release.sh`.
