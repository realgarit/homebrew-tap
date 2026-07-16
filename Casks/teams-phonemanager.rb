cask "teams-phonemanager" do
  version "3.22.0"

  on_arm do
    sha256 "bed11013b489ab3c46d24ae86d1307094436d4224bc4c4e8755339882cb42762"
    url "https://github.com/realgarit/teams-phonemanager/releases/download/v#{version}/teams-phonemanager-osx-arm64.zip"
  end
  on_intel do
    sha256 "8e6926b4b2bfe117486e3848fa5c608ebadf60de7a6c11d5114b3b91f727cc1d"
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
