cask "glint" do
  version "0.0.8"
  sha256 "ccdeb68625c07992dfa74712edc5e3cd03b1268a86e652bd0e71a4aa7cbee9e9"

  url "https://glint.binarybeam.net/releases/Glint-#{version}.dmg"
  name "Glint"
  desc "Claude Code session activity in your menu bar and notch"
  homepage "https://glint.binarybeam.net/"

  depends_on macos: :sonoma

  app "Glint.app"

  # Unsigned beta: brew applies the com.apple.quarantine flag on download, which
  # makes Gatekeeper block first launch. Strip it after install so a plain
  # `brew install --cask glint` opens cleanly. No sudo/password needed —
  # /Applications is admin-writable. DELETE this block once the app is notarized.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Glint.app"]
  end

  uninstall quit: "com.glint.app"

  zap trash: [
    "~/Library/Caches/com.glint.app",
    "~/Library/HTTPStorages/com.glint.app",
    "~/Library/Preferences/com.glint.app.plist",
  ]
end
