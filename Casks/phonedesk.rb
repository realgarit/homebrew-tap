cask "phonedesk" do
  version "3.35.3"

  on_arm do
    sha256 "e695cf3750ae620d3d12d0dfc1180418eb706716d65d1fca5e90efd134dffea0"
    url "https://github.com/realgarit/phonedesk/releases/download/v#{version}/phonedesk-osx-arm64.zip"
  end
  on_intel do
    sha256 "e41f3145ec50319d4482d3377c7e88ba687b875f80445e6bd486111d313750a4"
    url "https://github.com/realgarit/phonedesk/releases/download/v#{version}/phonedesk-osx-x64.zip"
  end

  name "PhoneDesk"
  desc "Microsoft Teams Phone System administration made simple"
  homepage "https://github.com/realgarit/phonedesk"

  depends_on macos: :sequoia

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
