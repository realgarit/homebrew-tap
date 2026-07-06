cask "teams-phonemanager" do
  version "3.17.0"

  on_arm do
    sha256 "2c772efc494fb3eea33aa5c3fd92d4bbe7c4727715cdd5c07de1cd70cb8d8609"
    url "https://github.com/realgarit/teams-phonemanager/releases/download/v#{version}/teams-phonemanager-osx-arm64.zip"
  end
  on_intel do
    sha256 "ccad04a5704326ebf4c40891ead4e48bebe9e9eaa9311211935866a05c6d4740"
    url "https://github.com/realgarit/teams-phonemanager/releases/download/v#{version}/teams-phonemanager-osx-x64.zip"
  end

  name "Teams Phone Manager"
  desc "Microsoft Teams Phone System administration made simple"
  homepage "https://github.com/realgarit/teams-phonemanager"

  depends_on macos: ">= :monterey"

  app "Teams Phone Manager.app"

  # The app is ad-hoc signed (not notarized); clear quarantine so Gatekeeper
  # does not block the launch.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Teams Phone Manager.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Preferences/ch.realgar.teams-phonemanager.plist",
  ]
end
