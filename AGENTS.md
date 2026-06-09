# Binary Beam Homebrew Tap — working notes

Shared Homebrew tap (`binary-beam/tap`) for Binary Beam's macOS apps. One cask
per app under `Casks/`. Install form: `brew install --cask binary-beam/tap/<app>`.

## Golden rule: README.md follows every cask change

**Any** time you add a cask, bump a `version`/`sha256`, or change install/runtime
behavior, update `README.md` in the SAME change:
- **Apps table** — one row per app: `[Name](site) — desc | brew install --cask binary-beam/tap/<app>`.
- **Notes** — signing/notarization status, arch (arm64 vs universal), min macOS.

README and the casks must never drift. Do this unprompted, every session.

## Adding / updating a cask

1. **Build the dmg** in the app repo, then `shasum -a 256 <App>-<ver>.dmg`.
2. **Host the exact dmg** at `https://<app>.binarybeam.net/releases/<App>-<ver>.dmg`
   (the landing site's `public/releases/`). Rebuilding changes the sha256 and
   breaks the cask — host the byte-identical dmg you hashed.
3. **Write/bump `Casks/<app>.rb`** (mirror `assetsnap.rb`):
   - `version`, `sha256`, `url ".../<App>-#{version}.dmg"`, `name`, `desc`
     (no leading article, no app name, ≤ ~80 chars), `homepage`.
   - `depends_on macos: :sonoma`; `app "<App>.app"`.
   - Unsigned/ad-hoc beta → `postflight` `xattr -dr com.apple.quarantine` on the
     installed app. DELETE that block once the app is notarized.
   - `uninstall quit: "<bundle-id>"`; `zap trash:` Caches/HTTPStorages/Preferences
     for the bundle id. Bundle ids differ per app — AssetSnap `com.assetsnap.AssetSnap`,
     Glint `com.glint.app` — don't copy blindly.
4. **Update `README.md`** (the golden rule above).
5. **Lint:** `ruby -c Casks/<app>.rb` and `brew style Casks/<app>.rb`.
   (`brew audit [path]` is disabled; audit by name only once the tap is installed.)

## Gotchas

- `glint.binarybeam.net` is not deployed yet (Glint-Landing is empty), so the
  glint cask URL 404s until the site + dmg ship. Cask is otherwise ready.
- Don't commit/push unless asked. The tap is a git repo; branch first if you do.
