cask "phonedesk" do
  version "3.29.1"

  on_arm do
    sha256 "0b3bf1357ce89a5504df48ca412344f82770ffc0836d3a9398c9f90d25c5aa5f"
    url "https://github.com/realgarit/phonedesk/releases/download/v#{version}/phonedesk-osx-arm64.zip"
  end
  on_intel do
    sha256 "69e8eadab9b652b8751796b4504dd518057a3740c9612e9944c61f3a9d6311bc"
    url "https://github.com/realgarit/phonedesk/releases/download/v#{version}/phonedesk-osx-x64.zip"
  end

  name "PhoneDesk"
  desc "Microsoft Teams Phone System administration made simple"
  homepage "https://github.com/realgarit/phonedesk"

  depends_on macos: :monterey

  app "PhoneDesk.app"

  # The app is ad-hoc signed (not notarized); clear quarantine so
  # Gatekeeper does not block the launch.
  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/PhoneDesk.app"],
        sudo: false
  end

  zap trash: [
    "~/Library/Preferences/ch.realgar.teams-phonemanager.plist",
  ]
end
