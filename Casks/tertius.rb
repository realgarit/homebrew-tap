cask "tertius" do
  version "0.1.0"
  sha256 "32ccfd47a8ddfa366fd7ca7de63b31e832fb9c01305fdbb66a18851290e2c5ee"

  url "https://github.com/realgarit/tertius/releases/download/v#{version}/Tertius.zip"
  name "Tertius"
  desc "Middle-mouse drag (orbit/pan) on the trackpad via Option + two-finger glide"
  homepage "https://github.com/realgarit/tertius"

  depends_on macos: :tahoe

  app "Tertius.app"

  zap trash: [
    "~/Library/Preferences/io.github.realgarit.tertius.plist",
  ]
end
