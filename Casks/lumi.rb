cask "lumi" do
  version "1.35.2"
  sha256 "e3a65f5688bd8ac010b0dad2238a24f6f3b4b5a6f5ca2b5127a9e1a817dd73d9"

  url "https://github.com/mogkhang/lumi/releases/download/#{version}/lumi-macos.dmg"
  name "Lumi"
  desc "Modern Plex client built with Flutter"
  homepage "https://github.com/mogkhang/lumi"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

  app "Lumi.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Lumi.app"],
                   sudo: false
  end

  uninstall quit: "com.mogkhang.lumi"

  zap trash: [
    "~/Library/Application Support/com.mogkhang.lumi",
    "~/Library/Caches/com.mogkhang.lumi",
    "~/Library/HTTPStorages/com.mogkhang.lumi",
    "~/Library/Preferences/com.mogkhang.lumi.plist",
    "~/Library/Saved Application State/com.mogkhang.lumi.savedState",
    "~/Library/WebKit/com.mogkhang.lumi",
  ]
end
