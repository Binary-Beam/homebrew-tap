cask "glint" do
  version "0.2.2"
  sha256 "e584c9f4418de2a6fdb19d8d15139f37e13b1de6d1020ac4f44b369e8f8ad4a4"

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
