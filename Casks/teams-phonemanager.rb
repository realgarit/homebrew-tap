cask "teams-phonemanager" do
  version "3.21.3"

  on_arm do
    sha256 "9487f92576f765d5736edaf275037a2a63445792a0ce1ee3cb3285e7f0ae6579"
    url "https://github.com/realgarit/teams-phonemanager/releases/download/v#{version}/teams-phonemanager-osx-arm64.zip"
  end
  on_intel do
    sha256 "8591b14792461ca256ab820f179fdee64610500bb673129fc1e8c520a61639ad"
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
