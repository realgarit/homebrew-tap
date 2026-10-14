cask "phonedesk" do
  version "3.30.0"

  on_arm do
    sha256 "ac2d7e09fb5dbe33ca3462e3650a2b1fcaaf9029a5dfada9daf7d39bae0ca12a"
    url "https://github.com/realgarit/phonedesk/releases/download/v#{version}/phonedesk-osx-arm64.zip"
  end
  on_intel do
    sha256 "b9d5409475520aec3408f93a17a17a0f5a5472b01ad07dd49cb4f8ec82a666b9"
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
