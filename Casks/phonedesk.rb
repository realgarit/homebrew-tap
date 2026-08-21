cask "phonedesk" do
  version "3.25.0"

  on_arm do
    sha256 "4a20c477183ec93915a465610d97c19b1c205fbd2ce763de25af5c79f7b3ac8f"
    url "https://github.com/realgarit/phonedesk/releases/download/v#{version}/phonedesk-osx-arm64.zip"
  end
  on_intel do
    sha256 "5a05f8918b39b305cb7f8c997deaa02acd97a48bc785989fd8880cbdcf1c3f89"
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
