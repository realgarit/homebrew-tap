cask "phonedesk" do
  version "3.26.1"

  on_arm do
    sha256 "68d456f1191b66d68e5929a77e46060b7d1ed4e82cfa34c28ca115a6d8b30479"
    url "https://github.com/realgarit/phonedesk/releases/download/v#{version}/phonedesk-osx-arm64.zip"
  end
  on_intel do
    sha256 "1787b280a21cf37a8e82bfa8a32391233328710e2746bbfc2e53530e929c710e"
    url "https://github.com/realgarit/phonedesk/releases/download/v#{version}/phonedesk-osx-x64.zip"
  end

  name "PhoneDesk"
  desc "Microsoft Teams Phone System administration made simple"
  homepage "https://github.com/realgarit/phonedesk"

  depends_on macos: :monterey

  app "PhoneDesk.app"

  # The app is ad-hoc signed (not notarized); clear quarantine so
  # Gatekeeper does not block the launch.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/PhoneDesk.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Preferences/ch.realgar.teams-phonemanager.plist",
  ]
end
