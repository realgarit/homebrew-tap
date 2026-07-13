cask "teams-phonemanager" do
  version "3.20.0"

  on_arm do
    sha256 "7193b5ad803f4b40f3b66b284587ee88429efe0f19451ee3eae499d90802b7b4"
    url "https://github.com/realgarit/teams-phonemanager/releases/download/v#{version}/teams-phonemanager-osx-arm64.zip"
  end
  on_intel do
    sha256 "d9843f5fc8f7030fe1d0d9ea25da29d566265d564efd2a8411aad1bc6d5d53f3"
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
