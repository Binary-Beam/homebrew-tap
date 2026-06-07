cask "assetsnap" do
  version "0.0.7"
  sha256 "ae7bb117ee6bf842810cd2edee6b1cedbbecee504120c63ed483bb1a92b9afb5"

  url "https://assetsnap.binarybeam.net/releases/AssetSnap-#{version}.dmg"
  name "AssetSnap"
  desc "Developer assets from your menu bar"
  homepage "https://assetsnap.binarybeam.net/"

  depends_on macos: :sonoma

  app "AssetSnap.app"

  # Unsigned beta: brew applies the com.apple.quarantine flag on download, which
  # makes Gatekeeper block first launch. Strip it after install so a plain
  # `brew install --cask assetsnap` opens cleanly. No sudo/password needed —
  # /Applications is admin-writable. DELETE this block once the app is notarized
  # (and flip `signed` in the website releases.json).
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/AssetSnap.app"]
  end

  uninstall quit: "com.assetsnap.AssetSnap"

  zap trash: [
    "~/Library/Caches/com.assetsnap.AssetSnap",
    "~/Library/HTTPStorages/com.assetsnap.AssetSnap",
    "~/Library/Preferences/com.assetsnap.AssetSnap.plist",
  ]
end
