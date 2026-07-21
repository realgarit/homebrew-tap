cask "teams-phonemanager" do
  version "3.23.1"

  on_arm do
    sha256 "71b241d54b39cbb782a4a135065fe426f4099924576292ca89146084bafa0ea7"
    url "https://github.com/realgarit/teams-phonemanager/releases/download/v#{version}/teams-phonemanager-osx-arm64.zip"
  end
  on_intel do
    sha256 "354b0168c184b5b340008854c7e212875f0ecce402247e61f7926152583c37e4"
    url "https://github.com/realgarit/teams-phonemanager/releases/download/v#{version}/teams-phonemanager-osx-x64.zip"
  end

  name "Teams Phone Manager"
  desc "Microsoft Teams Phone System administration made simple"
  homepage "https://github.com/realgarit/teams-phonemanager"

  depends_on macos: :monterey

  app "Teams Phone Manager.app"

  # The app is ad-hoc signed (not notarized); clear quarantine so
  # Gatekeeper does not block the launch.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Teams Phone Manager.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Preferences/ch.realgar.teams-phonemanager.plist",
  ]
end
